# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Base do
  let(:array) { Lite::Report::Array }
  let(:hash) { Lite::Report::Hash }
  let(:report) { Lite::Report::Report }

  context 'when exporting csv with stream csv option' do
    it 'to be an Enumarator object' do
      result = array.export(multi_array_1, csv_options: { stream: true })

      expect(result).to be_a(Enumerator)
    end
  end

  context 'when exporting csv with col_sep csv option' do
    it 'to be an array of arrays' do
      export!(
        klass: array,
        filename: :multi_options,
        data: multi_array_2,
        csv_options: {
          write_headers: true,
          headers: header_1,
          col_sep: ';'
        }
      )
    end

    it 'to be an array' do
      export!(
        klass: array,
        filename: :solo_options,
        data: solo_array_2,
        csv_options: {
          write_headers: true,
          headers: header_1,
          col_sep: ';'
        }
      )
    end
  end

  context 'when importing csv with typecast data option' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: multi_array_1,
        filename: :multi_headerless,
        data_options: { typecast: true }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: solo_array_1,
        filename: :solo_headerless,
        data_options: { typecast: true }
      )
    end
  end

  context 'when importing csv with encode data options' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: multi_array_2,
        filename: :multi_headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: solo_array_2,
        filename: :solo_headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end
  end

end
