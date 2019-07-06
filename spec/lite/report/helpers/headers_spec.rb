# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Headers do

  context 'when exporting an array csv with header csv option' do
    it 'to be an array of arrays' do
      export!(
        klass: array,
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
        klass: array,
        filename: :solo_headers,
        data: solo_array_2,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

  context 'when importing an array csv with header csv options' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: [header_1].concat(multi_array_2),
        filename: :multi_headerless,
        csv_options: { headers: header_1 }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: [header_1, solo_array_2],
        filename: :solo_headerless,
        csv_options: { headers: header_1 }
      )
    end
  end

  context 'when exporting a hash csv with write_header csv option' do
    it 'to be an array of hashes' do
      export!(
        klass: hash,
        filename: :multi_all,
        data: multi_hash_2,
        csv_options: { write_headers: true }
      )
    end

    it 'be a hash' do
      export!(
        klass: hash,
        filename: :solo_all,
        data: solo_hash_2,
        csv_options: { write_headers: true }
      )
    end
  end

  context 'when exporting a hash csv with header csv option' do
    it 'to be an array of hashes' do
      export!(
        klass: hash,
        filename: :multi_headers,
        data: multi_hash_2,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end

    it 'be a hash' do
      export!(
        klass: hash,
        filename: :solo_headers,
        data: solo_hash_2,
        csv_options: {
          write_headers: true,
          headers: header_2
        }
      )
    end
  end

end
