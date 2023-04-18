# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  # Activate the gem you are reporting the issue against.
  gem "activerecord", "~> 7.0.0"
  gem 'strong_migrations', path: 'gems'
  gem "sqlite3"
  gem "pry-byebug"
end
require "active_record"
require "minitest/autorun"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")

ActiveRecord::Schema.define do
  create_table :payments, force: true do |t|
    t.decimal :amount, precision: 10, scale: 0, default: 0, null: false
  end
end


class Payment < ActiveRecord::Base
end

# エラーにならない
class AddTitleToPayment < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :title, :string
    Payment.update_all title: "default_value"

  end
end

# エラーになる
# class AddTitleToPayment < ActiveRecord::Migration[7.0]
#   def change
#     add_column :payments, :title, :string, default: nil
#   end
# end


# module ActiveRecord
#   class Relation
#     def update_all(updates)
#       super
#     end
#   end
# end

class BugTest < Minitest::Test
  def test_migration
    AddTitleToPayment.migrate(:up)
  end
end