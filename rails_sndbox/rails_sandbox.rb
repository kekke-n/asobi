# frozen_string_literal: true

require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  git_source(:github) { |repo| "https://github.com/#{repo}.git" }

  gem "rails", github: "rails/rails", branch: "main"
  gem "sqlite3"
end

require "active_record"
# require "minitest/autorun"
# require "logger"

# This connection will do for database-independent bug reports.
ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: ":memory:")
ActiveRecord::Base.logger = Logger.new(STDOUT)


# ここから自由に書き換えられる

# テーブル作成
ActiveRecord::Schema.define do
  create_table :results, force: true do |t|
    t.string :hoge
    t.string :piyo
    t.integer :status
  end
end

# モデル作成
class Result < ActiveRecord::Base
  attr_accessor :hoge
  attr_accessor :piyo
  attr_accessor :status
end

# 自由にrubyを書く

body = {
  'results' => {
    'hoge' => 1,
    'piyo' => 1,
    'notice_status' => 'active'
  }
}

body['result']

result = Result.new

result.attributes={"hoge"=>'', "piyo"=>'', "status"=>1}


# # ここから対話
require "irb"
IRB.start(__FILE__)
