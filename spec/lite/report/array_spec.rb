# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  context 'when exporting csv without options' do
    it 'to be an array of arrays' do
      export!(
        filename: :multi_headerless,
        data: multi_array_2
      )
    end

    it 'to be an array' do
      export!(
        filename: :solo_headerless,
        data: solo_array_2
      )
    end
  end

  context 'when exporting csv with header csv option' do
    it 'to be an array of arrays' do
      export!(
        filename: :multi_headers,
        data: multi_array_2,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end

    it 'to be an array' do
      export!(
        filename: :solo_headers,
        data: solo_array_2,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

  context 'when importing csv without options' do
    it 'to be an array of arrays' do
      import!(
        template: multi_array_2,
        filename: :multi_headerless
      )
    end

    it 'to be an array' do
      import!(
        template: solo_array_2,
        filename: :solo_headerless
      )
    end
  end

  context 'when importing csv with header csv options' do
    it 'to be an array of arrays' do
      import!(
        template: [header_1].concat(multi_array_2),
        filename: :multi_headerless,
        csv_options: { headers: header_1 }
      )
    end

    it 'to be an array' do
      import!(
        template: [header_1, solo_array_2],
        filename: :solo_headerless,
        csv_options: { headers: header_1 }
      )
    end
  end

end
