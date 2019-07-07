# frozen_string_literal: true

require 'spec_helper'

# require 'activerecord-import'
# require 'activerecord-import/base'
# require 'activerecord-import/active_record/adapters/sqlite3_adapter'
require 'ransack'

RSpec.describe Lite::Report::Record do

  context 'when exporting a record csv' do
    before(:each) do
      hash_records.each { |hash| Car.create!(hash) }
    end

    it 'to be without options for ActiveRecord' do
      export!(
        filename: :headerless,
        data: active_record
      )
    end

    it 'to be without options for ActiveRelation' do
      export!(
        filename: :headerless,
        data: active_relation
      )
    end

    it 'to be without options for Ransack' do
      export!(
        filename: :headerless,
        data: ransack
      )
    end
  end

end
