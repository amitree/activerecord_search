require 'spec_helper'

class User < ActiveRecord::Base
end

describe ActiverecordSearch do
  let(:relation) { ActiveRecord::Relation.new(User, Arel::Table.new('users')) }

  shared_examples_for 'generates the correct query' do |condition, attribute, pattern, expected_arel_class = Arel::Nodes::Matches|
    let(:arel_nodes) { relation.where(condition).where_values }
    let(:arel_node) { arel_nodes.first }

    it 'returns a Arel::Nodes::Matches node' do
      expect(arel_nodes.length).to eq 1
      expect(arel_node).to be_an expected_arel_class
    end

    it 'matches on the specified attribute' do
      expect(arel_node.left.name).to eq attribute
    end

    it 'uses the right pattern' do
      expect(arel_node.right).to eq pattern
    end
  end

  describe 'searches for substrings' do
    it_should_behave_like 'generates the correct query', { foo: Search('bar') }, 'foo', '%bar%'
  end

  describe 'ends_with' do
    it_should_behave_like 'generates the correct query', { foo: Search(ends_with: 'bar') }, 'foo', '%bar'
  end

  describe 'starts_with' do
    it_should_behave_like 'generates the correct query', { foo: Search(ends_with: 'bar') }, 'foo', '%bar'
  end

  describe 'like' do
    it_should_behave_like 'generates the correct query', { foo: Search(like: '%foo%bar') }, 'foo', '%foo%bar'
  end

  describe 'nil values' do
    it_should_behave_like 'generates the correct query', { foo: Search(nil) }, 'foo', nil, Arel::Nodes::Equality
  end

  describe 'exceptions' do
    it 'should raise if an empty hash is passed' do
      expect { Search({}) }.to raise_error
    end
    it 'should raise if multiple hash keys are passed' do
      expect { Search({starts_with: 'a', ends_with: 'b'}) }.to raise_error
    end
    it 'should raise if an invalid hash key is passed' do
      expect { Search({foo: 'bar'}) }.to raise_error
    end
  end
end

