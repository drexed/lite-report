# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  context 'when exporting to csv without options' do
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

  context 'when exporting to csv with header csv option' do
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

  context 'when exporting to csv with col_sep csv option' do
    it 'to be an array of arrays' do
      export!(
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

  context 'when importing csv with typecast data option' do
    it 'to be an array of arrays' do
      import!(
        template: multi_array_1,
        filename: :multi_headerless,
        data_options: { typecast: true }
      )
    end

    it 'to be an array' do
      import!(
        template: solo_array_1,
        filename: :solo_headerless,
        data_options: { typecast: true }
      )
    end
  end

  # context 'when importing csv with headers to be an' do
  #   it 'to be an array of arrays' do
  #     import!(multi_array_2.unshift(header_1), :multi_headerless, headers: header_1)
  #   end
  #
  #   it 'to be an evaluated array of arrays' do
  #     carr = described_class.evaluate.import(multi_headerless_path,
  #                                            headers: header_1)
  #
  #     expect(carr).to eq(multi_array_1.dup.unshift(header_1))
  #   end
  #
  #   it 'to be an array' do
  #     import!([].push(header_1).push(solo_array_2), :solo_headerless, headers: header_1)
  #   end
  #
  #   it 'to be an evaluated array' do
  #     carr = described_class.evaluate.import(solo_headerless_path,
  #                                            headers: header_1)
  #
  #     expect(carr).to eq([].push(header_1).push(solo_array_1))
  #   end
  # end
  #
  # context 'when importing csv with options to be an' do
  #   it 'to be an array of arrays' do
  #     import!([].push(header_1).concat(multi_array_2), :multi_options, options: options)
  #   end
  #
  #   it 'to be an evaluated array of arrays' do
  #     carr = described_class.evaluate.import(multi_options_path,
  #                                            options: options)
  #
  #     expect(carr).to eq([].push(header_1).concat(multi_array_1))
  #   end
  #
  #   it 'to be an array' do
  #     import!([].push(header_1).push(solo_array_2), :solo_options, options: options)
  #   end
  #
  #   it 'to be an evaluated array' do
  #     carr = described_class.evaluate.import(solo_options_path,
  #                                            options: options)
  #
  #     expect(carr).to eq([].push(header_1).push(solo_array_1))
  #   end
  # end

end
