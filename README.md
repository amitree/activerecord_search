activerecord\_search
====================

This gem extends the ActiveRecord predicate builder to allow writing LIKE/ILIKE queries without writing raw SQL.

Usage
=====

Add to your Gemfile:

```ruby
gem 'activerecord_search'
```

Then you can write queries like this:

```ruby
users = User.where(name: Search('ji'))
  # Returns users "Jim" and "Benji"
users = User.where(name: Search(ends_with: 'ji'))
  # Returns user "Benji"
users = User.where(name: Search(starts_with: 'ji'))
  # Find user "Jim"
users = User.where(name: Search(like: 'b%i'))
  # Find users "Benji" and "Banh Mi"
```

Internally, it uses the Arel `matches` node, which becomes `ILIKE` for Postgres
and `LIKE` for other databases.  In general, this should be case insensitive.
