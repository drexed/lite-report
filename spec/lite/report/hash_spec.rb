# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Hash do
  let(:hash_type_1) do
    {
      'Id' => '1', 'Name' => 'Porche', 'Speed' => '225', 'Hp' => '430',
      'Crash safety rated' => 'true', 'Created at' => '2014-08-22 20:59:34 UTC'
    }
  end
  let(:hash_type_2) do
    {
      'Id' => 1, 'Name' => 'Porche', 'Speed' => 225, 'Hp' => 430,
      'Crash safety rated' => true, 'Created at' => '2014-08-22 20:59:34 UTC'
    }
  end
  let(:solo_array_string) do
    [
      {
        'Id' => '1', 'Name' => 'Ferrari', 'Speed' => '235', 'Hp' => '630',
        'Crash safety rated' => 'true', 'Created at' => '2014-08-23 20:59:34 UTC'
      },
      {
        'Id' => '2', 'Name' => 'Lamborghini', 'Speed' => '245', 'Hp' => '720',
        'Crash safety rated' => 'true', 'Created at' => '2014-08-24 20:59:34 UTC'
      },
      {
        'Id' => '3', 'Name' => 'Bugatti', 'Speed' => '256', 'Hp' => '1001',
        'Crash safety rated' => 'false', 'Created at' => '2014-08-25 20:59:34 UTC'
      }
    ]
  end
  let(:solo_array_typecast) do
    [
      {
        'Id' => 1, 'Name' => 'Ferrari', 'Speed' => 235, 'Hp' => 630,
        'Crash safety rated' => true, 'Created at' => '2014-08-23 20:59:34 UTC'
      },
      {
        'Id' => 2, 'Name' => 'Lamborghini', 'Speed' => 245, 'Hp' => 720,
        'Crash safety rated' => true, 'Created at' => '2014-08-24 20:59:34 UTC'
      },
      {
        'Id' => 3, 'Name' => 'Bugatti', 'Speed' => 256, 'Hp' => 1001,
        'Crash safety rated' => false, 'Created at' => '2014-08-25 20:59:34 UTC'
      }
    ]
  end

  context 'when exporting stream' do
    it 'returns true' do
      ccsv = described_class.export(solo_array_string, stream: true)

      expect(ccsv.is_a?(Enumerator)).to eq(true)
    end
  end

  context 'when exporting to csv all data' do
    it 'to be an array of hashes' do
      sarr = File.read(multi_all_path)
      ccsv = described_class.export(solo_array_string)

      expect(ccsv).to eq(sarr)
    end

    it 'hash' do
      sarr = File.read(solo_all_path)
      ccsv = described_class.export(hash_type_1)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv only values' do
    it 'to be an array of hashes' do
      sarr = File.read(multi_only_path)
      ccsv = described_class.export(solo_array_string,
                                    only: only_except_2)

      expect(ccsv).to eq(sarr)
    end

    it 'hash' do
      sarr = File.read(solo_only_path)
      ccsv = described_class.export(hash_type_1,
                                    only: only_except_1)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv except values' do
    it 'to be an array of hashes' do
      sarr = File.read(multi_except_path)
      ccsv = described_class.export(solo_array_string,
                                    except: only_except_2)

      expect(ccsv).to eq(sarr)
    end

    it 'hash' do
      sarr = File.read(solo_except_path)
      ccsv = described_class.export(hash_type_1,
                                    except: only_except_1)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv with headers' do
    it 'to be an array of hashes' do
      sarr = File.read(multi_headers_path)
      ccsv = described_class.export(solo_array_string,
                                    headers: header_type_2)

      expect(ccsv).to eq(sarr)
    end

    it 'hash' do
      sarr = File.read(solo_headers_path)
      ccsv = described_class.export(hash_type_1,
                                    headers: header_type_2)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when exporting to csv with options' do
    it 'to be an array of hashes' do
      sarr = File.read(multi_options_path)
      ccsv = described_class.export(solo_array_string,
                                    options: options)

      expect(ccsv).to eq(sarr)
    end

    it 'hash' do
      sarr = File.read(solo_options_path)
      ccsv = described_class.export(hash_type_1,
                                    options: options)

      expect(ccsv).to eq(sarr)
    end
  end

  context 'when importing csv without headers returns' do
    it 'an array of hashes' do
      carr = described_class.import(multi_all_path)

      expect(carr).to eq(solo_array_string)
    end

    it 'an evaluated array of hashes' do
      carr = described_class.evaluate.import(multi_all_path)

      expect(carr).to eq(solo_array_typecast)
    end

    it 'a hash' do
      carr = described_class.import(solo_all_path)

      expect(carr).to eq(hash_type_1)
    end

    it 'an evaluated hash' do
      carr = described_class.evaluate.import(solo_all_path)

      expect(carr).to eq(hash_type_2)
    end
  end

  context 'when importing csv with headers returns' do
    it 'an array of hashes' do
      carr = described_class.import(multi_headerless_path,
                                    headers: header_type_1)

      expect(carr).to eq(solo_array_string)
    end

    it 'an evaluated array of hashes' do
      carr = described_class.evaluate.import(multi_headerless_path,
                                             headers: header_type_1)

      expect(carr).to eq(solo_array_typecast)
    end

    it 'a hash' do
      carr = described_class.import(solo_headerless_path,
                                    headers: header_type_1)

      expect(carr).to eq(hash_type_1)
    end

    it 'an evaluated hash' do
      carr = described_class.evaluate.import(solo_headerless_path,
                                             headers: header_type_1)

      expect(carr).to eq(hash_type_2)
    end
  end

  context 'when importing csv only values returns' do
    it 'an array of arrays' do
      sarr = solo_array_string.dup.map { |v| v.dup.keep_if { |k, _v| only_except_2.include?(k) } }
      carr = described_class.import(multi_headerless_path,
                                    headers: header_type_1,
                                    only: only_except_2)

      expect(carr).to eq(sarr)
    end

    it 'an evaluated array of arrays' do
      sarr = solo_array_typecast.dup.map { |v| v.dup.keep_if { |k, _v| only_except_2.include?(k) } }
      carr = described_class.evaluate.import(multi_headerless_path,
                                             headers: header_type_1,
                                             only: only_except_2)

      expect(carr).to eq(sarr)
    end

    it 'a hash' do
      sarr = hash_type_1.dup.keep_if { |k, _v| only_except_1.include?(k) }
      carr = described_class.import(solo_headerless_path,
                                    headers: header_type_1,
                                    only: only_except_1)

      expect(carr).to eq(sarr)
    end

    it 'an evaluated hash' do
      sarr = hash_type_2.dup.keep_if { |k, _v| only_except_1.include?(k) }
      carr = described_class.evaluate.import(solo_headerless_path,
                                             headers: header_type_1,
                                             only: only_except_1)

      expect(carr).to eq(sarr)
    end
  end

  context 'when importing csv except values returns' do
    it 'an array of arrays' do
      sarr = solo_array_string.dup.map { |v| v.dup.delete_if { |k, _v| only_except_2.include?(k) } }
      carr = described_class.import(multi_headerless_path,
                                    headers: header_type_1,
                                    except: only_except_2)

      expect(carr).to eq(sarr)
    end

    it 'an evaluated array of arrays' do
      sarr = solo_array_typecast.dup.map { |v| v.dup.delete_if { |k, _v| only_except_2.include?(k) } }
      carr = described_class.evaluate.import(multi_headerless_path,
                                             headers: header_type_1,
                                             except: only_except_2)

      expect(carr).to eq(sarr)
    end

    it 'a hash' do
      sarr = hash_type_1.dup.delete_if { |k, _v| only_except_1.include?(k) }
      carr = described_class.import(solo_headerless_path,
                                    headers: header_type_1,
                                    except: only_except_1)

      expect(carr).to eq(sarr)
    end

    it 'an evaluated hash' do
      sarr = hash_type_2.dup.delete_if { |k, _v| only_except_1.include?(k) }
      carr = described_class.evaluate.import(solo_headerless_path,
                                             headers: header_type_1,
                                             except: only_except_1)

      expect(carr).to eq(sarr)
    end
  end

  context 'when importing csv with options returns' do
    it 'an array of hashes' do
      carr = described_class.import(multi_headerless_options_path,
                                    headers: header_type_1,
                                    options: options)

      expect(carr).to eq(solo_array_string)
    end

    it 'an evaluated array of hashes' do
      carr = described_class.evaluate.import(multi_headerless_options_path,
                                             headers: header_type_1,
                                             options: options)

      expect(carr).to eq(solo_array_typecast)
    end

    it 'a hash' do
      carr = described_class.import(solo_headerless_options_path,
                                    headers: header_type_1,
                                    options: options)

      expect(carr).to eq(hash_type_1)
    end

    it 'an evaluated hash' do
      carr = described_class.evaluate.import(solo_headerless_options_path,
                                             headers: header_type_1,
                                             options: options)

      expect(carr).to eq(hash_type_2)
    end
  end

end
