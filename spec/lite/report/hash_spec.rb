# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Hash do

  context 'when exporting a hash csv' do
    it 'to be without options' do
      export!(
        filename: :headerless,
        data: hash_index
      )
    end
  end

  context 'when importing a hash csv' do
    it 'to be without options' do
      import!(
        template: hash_index,
        filename: :headerless
      )
    end
  end

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
