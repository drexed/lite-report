# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Headers do

  context 'when exporting an array csv' do
    it 'to be with write_headers csv option' do
      export!(
        klass: Lite::Report::Array,
        filename: :headers,
        data: array,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

  context 'when importing an array csv' do
    it 'to be with headers csv options' do
      import!(
        klass: Lite::Report::Array,
        template: array,
        filename: :headers,
        csv_options: { headers: true }
      )
    end

    it 'to be with return_headers csv options' do
      import!(
        klass: Lite::Report::Array,
        template: array.unshift(header_1),
        filename: :headerless,
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting a hash csv' do
    it 'to be with write_headers csv option' do
      export!(
        klass: Lite::Report::Hash,
        filename: :all,
        data: hash_headers,
        csv_options: { write_headers: true }
      )
    end

    it 'to be with headers csv options' do
      export!(
        klass: Lite::Report::Hash,
        filename: :headers,
        data: hash_headers,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

  context 'when importing an hash csv' do
    it 'to be with headers csv options' do
      import!(
        klass: Lite::Report::Hash,
        template: hash_headers,
        filename: :all,
        csv_options: { headers: true }
      )
    end

    it 'to be with return_headers csv options' do
      import!(
        klass: Lite::Report::Hash,
        template: hash_headers,
        filename: :headerless,
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting a record csv' do
    before do
      hash_records.each { |hash| Car.create!(hash) }
    end

    it 'to be with write_headers csv option' do
      export!(
        klass: Lite::Report::Record,
        filename: :records,
        data: active_record,
        csv_options: { write_headers: true }
      )
    end

    it 'to be with headers csv options' do
      export!(
        klass: Lite::Report::Record,
        filename: :headers,
        data: active_relation,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

end
