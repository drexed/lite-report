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

  # context 'when exporting a hash csv with write_header csv option' do
  #   it 'to be an array of hashes' do
  #     export!(
  #       klass: hash,
  #       filename: :multi_all,
  #       data: multi_hash_2,
  #       csv_options: { write_headers: true }
  #     )
  #   end
  #
  #   it 'be a hash' do
  #     export!(
  #       klass: hash,
  #       filename: :solo_all,
  #       data: solo_hash_2,
  #       csv_options: { write_headers: true }
  #     )
  #   end
  # end
  #
  # context 'when exporting a hash csv with header csv option' do
  #   it 'to be an array of hashes' do
  #     export!(
  #       klass: hash,
  #       filename: :multi_headers,
  #       data: multi_hash_2,
  #       csv_options: {
  #         write_headers: true,
  #         headers: header_2
  #       }
  #     )
  #   end
  #
  #   it 'be a hash' do
  #     export!(
  #       klass: hash,
  #       filename: :solo_headers,
  #       data: solo_hash_2,
  #       csv_options: {
  #         write_headers: true,
  #         headers: header_2
  #       }
  #     )
  #   end
  # end

end
