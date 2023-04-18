require "bundler/inline"

gemfile(true) do
  source "https://rubygems.org"

  gem 'awesome_print', '~> 1.8'
end

require 'awesome_print'

# # ここから対話
require "irb"
IRB.start(__FILE__)
