# frozen_string_literal: true

require 'spec_helper'
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

  context 'when importing a record csv' do
    it 'to be raise an ArgumentError' do
      expect {
        described_class.import("spec/support/fixtures/csv/headerless.csv")
      }.to raise_error(ArgumentError)
    end

    it 'to be without options' do
      described_class.import(
        "spec/support/fixtures/csv/headerless.csv",
        data_options: { klass: active_record }
      )

      expect(active_record.count).to eq(3)
    end
  end

end
