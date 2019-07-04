# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  let(:array_type_3) do
    [
      ['1', 'Ferrari', '235', '630', 'true', '2014-08-23T20:59:34.000Z'],
      ['2', 'Lamborghini', '245', '720', 'true', '2014-08-24T20:59:34.000Z'],
      ['3', 'Bugatti', '256', '1001', 'false', '2014-08-25T20:59:34.000Z']
    ]
  end

  context 'when exporting to csv without headers' do
    it 'to be an array of arrays' do
      export!(:multi_headerless, multi_array_string)
    end

    it 'to be an array' do
      export!(:solo_headerless, solo_array_string)
    end
  end

  context 'when exporting to csv with headers' do
    it 'to be an array of arrays' do
      export!(:multi_headers, multi_array_string, headers: header_type_2)
    end

    it 'to be an array' do
      export!(:solo_headers, solo_array_string, headers: header_type_2)
    end
  end

  context 'when exporting to csv with options' do
    it 'to be an array of arrays' do
      export!(:multi_options, multi_array_string, headers: header_type_1, options: options)
    end

    it 'to be an array' do
      export!(:solo_options, solo_array_string, headers: header_type_1, options: options)
    end
  end

  context 'when importing csv without headers to be an' do
    it 'to be an array of arrays' do
      carr = described_class.import(multi_headerless_path)

      expect(carr).to eq(multi_array_string)
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_headerless_path)

      expect(carr).to eq(multi_array_typecast)
    end

    it 'to be an array' do
      carr = described_class.import(solo_headerless_path)

      expect(carr).to eq(solo_array_string)
    end

    it 'evaluated array' do
      carr = described_class.evaluate.import(solo_headerless_path)

      expect(carr).to eq(solo_array_typecast)
    end
  end

  context 'when importing csv with headers to be an' do
    it 'to be an array of arrays' do
      carr = described_class.import(multi_headerless_path,
                                    headers: header_type_1)

      expect(carr).to eq(multi_array_string.dup.unshift(header_type_1))
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_headerless_path,
                                             headers: header_type_1)

      expect(carr).to eq(multi_array_typecast.dup.unshift(header_type_1))
    end

    it 'to be an array' do
      carr = described_class.import(solo_headerless_path,
                                    headers: header_type_1)

      expect(carr).to eq([].push(header_type_1).push(solo_array_string))
    end

    it 'evaluated array' do
      carr = described_class.evaluate.import(solo_headerless_path,
                                             headers: header_type_1)

      expect(carr).to eq([].push(header_type_1).push(solo_array_typecast))
    end
  end

  context 'when importing csv with options to be an' do
    it 'to be an array of arrays' do
      carr = described_class.import(multi_options_path,
                                    options: options)

      expect(carr).to eq([].push(header_type_1).concat(multi_array_string))
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_options_path,
                                             options: options)

      expect(carr).to eq([].push(header_type_1).concat(multi_array_typecast))
    end

    it 'to be an array' do
      carr = described_class.import(solo_options_path,
                                    options: options)

      expect(carr).to eq([].push(header_type_1).push(solo_array_string))
    end

    it 'evaluated array' do
      carr = described_class.evaluate.import(solo_options_path,
                                             options: options)

      expect(carr).to eq([].push(header_type_1).push(solo_array_typecast))
    end
  end

end
