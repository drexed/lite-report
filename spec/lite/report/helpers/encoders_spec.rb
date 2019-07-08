# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Encoders do

  context 'when importing an array csv' do
    it 'to be with encode data options' do
      import!(
        klass: Lite::Report::Array,
        template: array,
        filename: :headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end
  end

  context 'when importing an hash csv' do
    it 'to be with encode data options' do
      import!(
        klass: Lite::Report::Hash,
        template: hash,
        filename: :headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end
  end

  context 'when importing an record csv' do
    it 'to be with encode data options' do
      Lite::Report::Record.import(
        "spec/support/fixtures/csv/headerless.csv",
        data_options: {
          klass: active_record,
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )

      expect(active_record.count).to eq(3)
    end
  end

end
