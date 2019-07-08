# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Filters do

  context 'when exporting an array csv' do
    it 'to be with only data option' do
      export!(
        klass: Lite::Report::Array,
        filename: :only,
        data: array,
        data_options: { only: only_except },
        csv_options: {
          write_headers: true,
          headers: only
        }
      )
    end

    it 'to be with except data option' do
      export!(
        klass: Lite::Report::Array,
        filename: :except,
        data: array,
        data_options: { except: only_except },
        csv_options: {
          write_headers: true,
          headers: except
        }
      )
    end
  end

  context 'when importing an array csv' do
    it 'to be with only data option' do
      import!(
        klass: Lite::Report::Array,
        template: array_only.unshift(only),
        filename: :headerless,
        data_options: { only: only_except },
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end

    it 'to be with except data option' do
      import!(
        klass: Lite::Report::Array,
        template: array_except.unshift(except),
        filename: :headerless,
        data_options: { except: only_except },
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting an hash csv' do
    it 'to be with only data option' do
      export!(
        klass: Lite::Report::Hash,
        filename: :only,
        data: hash_headers,
        data_options: { only: only },
        csv_options: {
          write_headers: true,
          headers: only
        }
      )
    end

    it 'to be with except data option' do
      export!(
        klass: Lite::Report::Hash,
        filename: :except,
        data: hash_headers,
        data_options: { except: except },
        csv_options: {
          write_headers: true,
          headers: except
        }
      )
    end
  end

  context 'when importing an hash csv' do
    it 'to be with only data option' do
      import!(
        klass: Lite::Report::Hash,
        template: hash_only,
        filename: :all,
        data_options: { only: only },
        csv_options: { headers: true }
      )
    end

    it 'to be with except data option' do
      import!(
        klass: Lite::Report::Hash,
        template: hash_except,
        filename: :headerless,
        data_options: { except: except },
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting an record csv' do
    before(:each) do
      hash_records.each { |hash| Car.create!(hash) }
    end

    it 'to be with only data option' do
      export!(
        klass: Lite::Report::Record,
        filename: :only,
        data: active_record,
        data_options: { only: only_columns },
        csv_options: {
          write_headers: true,
          headers: only
        }
      )
    end

    it 'to be with except data option' do
      export!(
        klass: Lite::Report::Record,
        filename: :except,
        data: active_relation,
        data_options: { except: except_columns },
        csv_options: {
          write_headers: true,
          headers: except
        }
      )
    end
  end

  context 'when importing an record csv' do
    it 'to be with only data option' do
      Lite::Report::Record.import(
        "spec/support/fixtures/csv/headerless.csv",
        data_options: {
          klass: active_record,
          only: only_columns
        }
      )

      results = active_record.last.attributes.values.compact.size

      expect(results).to eq(only_columns.size + 1)
    end

    it 'to be with except data option' do
      Lite::Report::Record.import(
        "spec/support/fixtures/csv/headerless.csv",
        data_options: {
          klass: active_record,
          only: except_columns
        }
      )

      results = active_record.last.attributes.values.compact.size

      expect(results).to eq(except_columns.size + 1)
    end
  end

end
