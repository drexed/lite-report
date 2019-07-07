# frozen_string_literal: true

require 'spec_helper'

# require 'activerecord-import'
# require 'activerecord-import/base'
# require 'activerecord-import/active_record/adapters/sqlite3_adapter'
require 'ransack'

RSpec.describe Lite::Report::Record do

  context 'when exporting a record csv' do
    before(:each) do
      record.each { |hash| Car.create!(hash) }
    end

    it 'to be without options for ActiveRecord' do
      export!(
        filename: :headerless,
        data: Car
      )
    end

    it 'to be without options for ActiveRelation' do
      export!(
        filename: :headerless,
        data: Car.where(speed: 0..999)
      )
    end

    it 'to be without options for Ransack' do
      export!(
        filename: :headerless,
        data: Car.ransack(speed_gt: 0)
      )
    end
  end

  # context 'when exporting csv all data' do
  #   it 'to be an array of records' do
  #     hash_type_1.each { |v| Car.create!(v) }
  #
  #     sarr = File.read(multi_all_path)
  #     ccsv = described_class.export(Car.all)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'record' do
  #     Car.create!(hash_type_2)
  #
  #     sarr = File.read(solo_all_path)
  #     ccsv = described_class.export(Car.first)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end
  #
  # context 'when exporting csv only values' do
  #   it 'to be an array of records' do
  #     hash_type_1.each { |v| Car.create!(v) }
  #
  #     sarr = File.read(multi_only_path)
  #     ccsv = described_class.export(Car.all,
  #                                   only: %i[id name])
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'record' do
  #     Car.create!(hash_type_2)
  #
  #     sarr = File.read(solo_only_path)
  #     ccsv = described_class.export(Car.first,
  #                                   only: :name)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end
  #
  # context 'when exporting csv except values' do
  #   it 'to be an array of records' do
  #     hash_type_1.each { |v| Car.create!(v) }
  #
  #     sarr = File.read(multi_except_path)
  #     ccsv = described_class.export(Car.all,
  #                                   except: %i[id name])
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'record' do
  #     Car.create!(hash_type_2)
  #
  #     sarr = File.read(solo_except_path)
  #     ccsv = described_class.export(Car.first,
  #                                   except: :name)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end
  #
  # context 'when exporting csv with headers' do
  #   it 'to be an array of records' do
  #     hash_type_1.each { |v| Car.create!(v) }
  #
  #     sarr = File.read(multi_headers_path)
  #     ccsv = described_class.export(Car.all,
  #                                   headers: header_2)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'record' do
  #     Car.create!(hash_type_2)
  #
  #     sarr = File.read(solo_headers_path)
  #     ccsv = described_class.export(Car.first,
  #                                   headers: header_2)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end
  #
  # context 'when exporting csv with options' do
  #   it 'to be an array of records' do
  #     hash_type_1.each { |v| Car.create!(v) }
  #
  #     sarr = File.read(multi_options_path)
  #     ccsv = described_class.export(Car.all,
  #                                   options: options)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  #
  #   it 'record' do
  #     Car.create!(hash_type_2)
  #
  #     sarr = File.read(solo_options_path)
  #     ccsv = described_class.export(Car.first,
  #                                   options: options)
  #
  #     expect(ccsv).to eq(sarr)
  #   end
  # end

  # context 'when importing csv without headers to create' do
  #   it '3 cars' do
  #     described_class.import(multi_all_path,
  #                            model: Car)
  #
  #     expect(Car.count).to eq(3)
  #   end
  #
  #   it '1 car' do
  #     described_class.import(solo_all_path,
  #                            model: Car)
  #
  #     expect(Car.count).to eq(1)
  #   end
  # end
  #
  # context 'when importing csv with headers to create' do
  #   it '3 cars' do
  #     described_class.import(multi_headerless_path,
  #                            model: Car,
  #                            headers: header_1)
  #
  #     expect(Car.count).to eq(3)
  #   end
  #
  #   it '1 car' do
  #     described_class.import(solo_headerless_path,
  #                            model: Car,
  #                            headers: header_1)
  #
  #     expect(Car.count).to eq(1)
  #   end
  # end
  #
  # context 'when importing csv only values to create' do
  #   it '3 cars' do
  #     described_class.import(multi_headerless_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            only: :name)
  #
  #     expect(Car.where.not(name: nil).count).to eq(3)
  #   end
  #
  #   it '1 car' do
  #     described_class.import(solo_headerless_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            only: :name)
  #
  #     expect(Car.where.not(name: nil).count).to eq(1)
  #   end
  # end
  #
  # context 'when importing csv except values to create' do
  #   it '3 cars' do
  #     described_class.import(multi_headerless_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            except: :name)
  #
  #     expect(Car.where(name: nil).count).to eq(3)
  #   end
  #
  #   it '1 car' do
  #     described_class.import(solo_headerless_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            except: :name)
  #
  #     expect(Car.where(name: nil).count).to eq(1)
  #   end
  # end
  #
  # context 'when importing csv with options to create' do
  #   it '3 cars' do
  #     described_class.import(multi_headerless_options_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            options: options)
  #
  #     expect(Car.count).to eq(3)
  #   end
  #
  #   it '1 car' do
  #     described_class.import(solo_headerless_options_path,
  #                            model: Car,
  #                            headers: header_1,
  #                            options: options)
  #
  #     expect(Car.count).to eq(1)
  #   end
  # end

end
