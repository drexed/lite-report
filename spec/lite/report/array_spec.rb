# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  context 'when exporting to csv without headers for an' do
    it 'array of arrays' do
      export!(:multi_headerless, multi_array_string)
    end

    it 'array' do
      sarr = File.read(solo_headerless_path)
      ccsv = described_class.export(solo_array_string)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv with headers for an' do
    it 'array of arrays' do
      sarr = File.read(multi_headers_path)
      ccsv = described_class.export(multi_array_string,
                                    headers: header_type_2)

      expect(ccsv).to eq(sarr)
    end

    it 'array' do
      sarr = File.read(solo_headers_path)
      ccsv = described_class.export(solo_array_string,
                                    headers: header_type_2)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv with options for an' do
    it 'array of arrays' do
      sarr = File.read(multi_options_path)
      ccsv = described_class.export(multi_array_string,
                                    headers: header_type_1,
                                    options: options)

      expect(ccsv).to eq(sarr)
    end

    it 'array' do
      sarr = File.read(solo_options_path)
      ccsv = described_class.export(solo_array_string,
                                    headers: header_type_1,
                                    options: options)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when importing csv without headers to be an' do
    it 'array of arrays' do
      carr = described_class.import(multi_headerless_path)

      expect(carr).to eq(multi_array_string)
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_headerless_path)

      expect(carr).to eq(multi_array_typecast)
    end

    it 'array' do
      carr = described_class.import(solo_headerless_path)

      expect(carr).to eq(solo_array_string)
    end

    it 'evaluated array' do
      carr = described_class.evaluate.import(solo_headerless_path)

      expect(carr).to eq(solo_array_typecast)
    end
  end

  context 'when importing csv with headers to be an' do
    it 'array of arrays' do
      carr = described_class.import(multi_headerless_path,
                                    headers: header_type_1)

      expect(carr).to eq(multi_array_string.dup.unshift(header_type_1))
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_headerless_path,
                                             headers: header_type_1)

      expect(carr).to eq(multi_array_typecast.dup.unshift(header_type_1))
    end

    it 'array' do
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
    it 'array of arrays' do
      carr = described_class.import(multi_options_path,
                                    options: options)

      expect(carr).to eq([].push(header_type_1).concat(multi_array_string))
    end

    it 'evaluated array of arrays' do
      carr = described_class.evaluate.import(multi_options_path,
                                             options: options)

      expect(carr).to eq([].push(header_type_1).concat(multi_array_typecast))
    end

    it 'array' do
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
