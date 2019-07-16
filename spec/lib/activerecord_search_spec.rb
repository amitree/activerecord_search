require 'spec_helper'

describe ActiverecordSearch do
  if Rails::VERSION::MINOR > 1
    let(:relation) { ActiveRecord::Relation.new(User, table: Arel::Table.new('users'), predicate_builder: User.predicate_builder) }
  else
    let(:relation) { ActiveRecord::Relation.new(User, Arel::Table.new('users'), User.predicate_builder) }
  end

  shared_examples_for 'generates the correct query' do |condition, attribute, pattern|
    let(:arel_nodes) { relation.where(condition).where_clause.ast.children }

    if Rails::VERSION::MINOR > 1
      let(:arel_node) { arel_nodes.first }
    else
      let(:arel_node) { arel_nodes.first.expr }
    end

    it 'returns a Arel::Nodes::Matches node' do
      expect(arel_nodes.length).to eq 1
      expect(arel_node).to be_an Arel::Nodes::Matches
    end

    it 'matches on the specified attribute' do
      expect(arel_node.left.name).to eq attribute
    end

    it 'uses the right pattern' do
      expect(arel_node.right.val).to eq pattern
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
    it 'should return nil if nil is passed in' do
      expect(Search(nil)).to be_nil
    end
  end

  describe 'exceptions' do
    it 'should raise if an empty hash is passed' do
      expect { Search({}) }.to raise_error(RuntimeError)
    end
    it 'should raise if multiple hash keys are passed' do
      expect { Search({starts_with: 'a', ends_with: 'b'}) }.to raise_error(RuntimeError)
    end
    it 'should raise if an invalid hash key is passed' do
      expect { Search({foo: 'bar'}) }.to raise_error(RuntimeError)
    end
  end
end

