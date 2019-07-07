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

  # context 'when exporting a hash csv with only option' do
  #   it 'to be an array of hashes' do
  #     export!(
  #       klass: hash,
  #       filename: :multi_only,
  #       data: multi_hash_2,
  #       data_options: { only: only_except_2 },
  #       csv_options: { write_headers: true }
  #     )
  #   end
  #
  #   it 'be a hash' do
  #     export!(
  #       klass: hash,
  #       filename: :solo_only,
  #       data: solo_hash_2,
  #       data_options: { only: only_except_1 },
  #       csv_options: { write_headers: true }
  #     )
  #   end
  # end
  #
  # context 'when exporting a hash csv with except option' do
  #   it 'to be an array of hashes' do
  #     export!(
  #       klass: hash,
  #       filename: :multi_except,
  #       data: multi_hash_2,
  #       data_options: { except: only_except_2 },
  #       csv_options: { write_headers: true }
  #     )
  #   end
  #
  #   it 'be a hash' do
  #     export!(
  #       klass: hash,
  #       filename: :solo_except,
  #       data: solo_hash_2,
  #       data_options: { except: only_except_1 },
  #       csv_options: { write_headers: true }
  #     )
  #   end
  # end

end
