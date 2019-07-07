# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Filters do

  context 'when exporting an array csv with only option' do
    it 'to be an array of arrays' do
      export!(
        klass: array,
        filename: :multi_only,
        data: multi_array_2,
        data_options: { only: [0, 1] },
        csv_options: {
          write_headers: true,
          headers: header_1
        }
      )
    end

    it 'be an array' do
      export!(
        klass: array,
        filename: :solo_only,
        data: solo_array_2,
        data_options: { only: [1] },
        csv_options: {
          write_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting an array csv with except option' do
    it 'to be an array of arrays' do
      export!(
        klass: array,
        filename: :multi_except,
        data: multi_array_2,
        data_options: { except: [0, 1] },
        csv_options: {
          write_headers: true,
          headers: header_1
        }
      )
    end

    it 'be an array' do
      export!(
        klass: array,
        filename: :solo_except,
        data: solo_array_2,
        data_options: { except: [1] },
        csv_options: {
          write_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when importing an array csv without options' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: multi_array_2,
        filename: :multi_headerless,
        data_options: { only: [0, 1] },
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: solo_array_2,
        filename: :solo_headerless,
        data_options: { only: [0, 1] },
        csv_options: {
          return_headers: true,
          headers: header_1
        }
      )
    end
  end

  context 'when exporting a hash csv with only option' do
    it 'to be an array of hashes' do
      export!(
        klass: hash,
        filename: :multi_only,
        data: multi_hash_2,
        data_options: { only: only_except_2 },
        csv_options: { write_headers: true }
      )
    end

    it 'be a hash' do
      export!(
        klass: hash,
        filename: :solo_only,
        data: solo_hash_2,
        data_options: { only: only_except_1 },
        csv_options: { write_headers: true }
      )
    end
  end

  context 'when exporting a hash csv with except option' do
    it 'to be an array of hashes' do
      export!(
        klass: hash,
        filename: :multi_except,
        data: multi_hash_2,
        data_options: { except: only_except_2 },
        csv_options: { write_headers: true }
      )
    end

    it 'be a hash' do
      export!(
        klass: hash,
        filename: :solo_except,
        data: solo_hash_2,
        data_options: { except: only_except_1 },
        csv_options: { write_headers: true }
      )
    end
  end

end
