

require "active_record"

ActiveRecord::Base.establish_connection(adapter: "sqlite3", database: "dbfile")

# テーブル作成
ActiveRecord::Schema.define do
  create_table :ducks, force: true do |t|
    t.string :name
  end
end

class Duck < ActiveRecord::Base
end
# # ここから対話
require "irb"
IRB.start(__FILE__)
