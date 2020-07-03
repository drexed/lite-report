# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Encoders do
  let(:encode_options) do
    [
      'UTF-8',
      'binary',
      invalid: :replace,
      undef: :replace,
      replace: '',
      UNIVERSAL_NEWLINE_DECORATOR: true
    ]
  end

  context 'when importing an array csv' do
    it 'to be with encode data options' do
      import!(
        klass: Lite::Report::Array,
        template: array,
        filename: :headerless,
        data_options: { encode: encode_options }
      )
    end
  end

  context 'when importing an hash csv' do
    it 'to be with encode data options' do
      import!(
        klass: Lite::Report::Hash,
        template: hash,
        filename: :headerless,
        data_options: { encode: encode_options }
      )
    end
  end

  context 'when importing an record csv' do
    it 'to be with encode data options' do
      Lite::Report::Record.import(
        'spec/support/fixtures/csv/headerless.csv',
        data_options: {
          klass: active_record,
          encode: encode_options
        }
      )

      expect(active_record.count).to eq(3)
    end
  end

end
