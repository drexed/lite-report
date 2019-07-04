# frozen_string_literal: true

require 'active_record'

ActiveRecord::Base.time_zone_aware_attributes = true
ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:',
  encoding: 'utf8',
  pool: 5,
  timeout: 5000,
  verbosity: 'quiet'
)

ActiveRecord::Migration.verbose = false

ActiveRecord::Schema.define(version: 1) do
  create_table :cars, force: true do |t|
    t.string :name
    t.integer :speed
    t.integer :hp
    t.boolean :crash_safety_rated
    t.datetime :created_at
  end
end
