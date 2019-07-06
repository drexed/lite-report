# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Hash do

  context 'when exporting a hash csv without options' do
    it 'to be an array of hashes' do
      export!(
        filename: :multi_headerless,
        data: multi_hash_2
      )
    end

    it 'to be a hash' do
      export!(
        filename: :solo_headerless,
        data: solo_hash_2
      )
    end
  end

  # context 'when exporting csv with options' do
  #   it 'to be an array of hashes' do
  #     sarr = File.read(multi_options_path)
  #     ccsv = described_class.export(solo_array_2,
  #                                   options: options)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'to be a hash' do
  #     sarr = File.read(solo_options_path)
  #     ccsv = described_class.export(hash_type_2,
  #                                   options: options)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end

  # context 'when importing csv without headers returns' do
  #   it 'an array of hashes' do
  #     carr = described_class.import(multi_all_path)
  #
  #     expect(carr).to eq(solo_array_2)
  #   end
  #
  #   it 'an evaluated array of hashes' do
  #     carr = described_class.evaluate.import(multi_all_path)
  #
  #     expect(carr).to eq(solo_array_1)
  #   end
  #
  #   it 'a hash' do
  #     carr = described_class.import(solo_all_path)
  #
  #     expect(carr).to eq(hash_type_2)
  #   end
  #
  #   it 'an evaluated hash' do
  #     carr = described_class.evaluate.import(solo_all_path)
  #
  #     expect(carr).to eq(hash_type_1)
  #   end
  # end
  #
  # context 'when importing csv with headers returns' do
  #   it 'an array of hashes' do
  #     carr = described_class.import(multi_headerless_path,
  #                                   headers: header_1)
  #
  #     expect(carr).to eq(solo_array_2)
  #   end
  #
  #   it 'an evaluated array of hashes' do
  #     carr = described_class.evaluate.import(multi_headerless_path,
  #                                            headers: header_1)
  #
  #     expect(carr).to eq(solo_array_1)
  #   end
  #
  #   it 'a hash' do
  #     carr = described_class.import(solo_headerless_path,
  #                                   headers: header_1)
  #
  #     expect(carr).to eq(hash_type_2)
  #   end
  #
  #   it 'an evaluated hash' do
  #     carr = described_class.evaluate.import(solo_headerless_path,
  #                                            headers: header_1)
  #
  #     expect(carr).to eq(hash_type_1)
  #   end
  # end
  #
  # context 'when importing csv only values returns' do
  #   it 'an array of arrays' do
  #     sarr = solo_array_2.dup.map { |v| v.dup.keep_if { |k, _v| only_except_2.include?(k) } }
  #     carr = described_class.import(multi_headerless_path,
  #                                   headers: header_1,
  #                                   only: only_except_2)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'an evaluated array of arrays' do
  #     sarr = solo_array_1.dup.map { |v| v.dup.keep_if { |k, _v| only_except_2.include?(k) } }
  #     carr = described_class.evaluate.import(multi_headerless_path,
  #                                            headers: header_1,
  #                                            only: only_except_2)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'a hash' do
  #     sarr = hash_type_2.dup.keep_if { |k, _v| only_except_1.include?(k) }
  #     carr = described_class.import(solo_headerless_path,
  #                                   headers: header_1,
  #                                   only: only_except_1)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'an evaluated hash' do
  #     sarr = hash_type_1.dup.keep_if { |k, _v| only_except_1.include?(k) }
  #     carr = described_class.evaluate.import(solo_headerless_path,
  #                                            headers: header_1,
  #                                            only: only_except_1)
  #
  #     expect(carr).to eq(sarr)
  #   end
  # end
  #
  # context 'when importing csv except values returns' do
  #   it 'an array of arrays' do
  #     sarr = solo_array_2.dup.map { |v| v.dup.delete_if { |k, _v| only_except_2.include?(k) } }
  #     carr = described_class.import(multi_headerless_path,
  #                                   headers: header_1,
  #                                   except: only_except_2)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'an evaluated array of arrays' do
  #     sarr = solo_array_1.dup.map { |v| v.dup.delete_if { |k, _v| only_except_2.include?(k) } }
  #     carr = described_class.evaluate.import(multi_headerless_path,
  #                                            headers: header_1,
  #                                            except: only_except_2)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'a hash' do
  #     sarr = hash_type_2.dup.delete_if { |k, _v| only_except_1.include?(k) }
  #     carr = described_class.import(solo_headerless_path,
  #                                   headers: header_1,
  #                                   except: only_except_1)
  #
  #     expect(carr).to eq(sarr)
  #   end
  #
  #   it 'an evaluated hash' do
  #     sarr = hash_type_1.dup.delete_if { |k, _v| only_except_1.include?(k) }
  #     carr = described_class.evaluate.import(solo_headerless_path,
  #                                            headers: header_1,
  #                                            except: only_except_1)
  #
  #     expect(carr).to eq(sarr)
  #   end
  # end
  #
  # context 'when importing csv with options returns' do
  #   it 'an array of hashes' do
  #     carr = described_class.import(multi_headerless_options_path,
  #                                   headers: header_1,
  #                                   options: options)
  #
  #     expect(carr).to eq(solo_array_2)
  #   end
  #
  #   it 'an evaluated array of hashes' do
  #     carr = described_class.evaluate.import(multi_headerless_options_path,
  #                                            headers: header_1,
  #                                            options: options)
  #
  #     expect(carr).to eq(solo_array_1)
  #   end
  #
  #   it 'a hash' do
  #     carr = described_class.import(solo_headerless_options_path,
  #                                   headers: header_1,
  #                                   options: options)
  #
  #     expect(carr).to eq(hash_type_2)
  #   end
  #
  #   it 'an evaluated hash' do
  #     carr = described_class.evaluate.import(solo_headerless_options_path,
  #                                            headers: header_1,
  #                                            options: options)
  #
  #     expect(carr).to eq(hash_type_1)
  #   end
  # end

end
