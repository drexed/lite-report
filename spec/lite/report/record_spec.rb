# # frozen_string_literal: true
#
# require 'spec_helper'
#
# RSpec.describe Lite::Report::Record do
#   let(:hash_type_2) do
#     { name: 'Porche', speed: '225', hp: '430', crash_safety_rated: 'true', created_at: '2014-08-22 20:59:34 UTC' }
#   end
#   let(:hash_type_1) do
#     [
#       { name: 'Ferrari', speed: '235', hp: '630', crash_safety_rated: 'true', created_at: '2014-08-23 20:59:34 UTC' },
#       { name: 'Lamborghini', speed: '245', hp: '720', crash_safety_rated: 'true', created_at: '2014-08-24 20:59:34 UTC' },
#       { name: 'Bugatti', speed: '256', hp: '1001', crash_safety_rated: 'false', created_at: '2014-08-25 20:59:34 UTC' }
#     ]
#   end
#   let(:hash_type_3) do
#     { id: 1, name: 'Porche', speed: '225', hp: '430', crash_safety_rated: 'true', created_at: '2014-08-22 20:59:34 UTC' }
#   end
#   let(:hash_type_4) do
#     [
#       { id: 1, name: 'Ferrari', speed: '235', hp: '630', crash_safety_rated: 'true', created_at: '2014-08-23 20:59:34 UTC' },
#       { id: 2, name: 'Lamborghini', speed: '245', hp: '720', crash_safety_rated: 'true', created_at: '2014-08-24 20:59:34 UTC' },
#       { id: 3, name: 'Bugatti', speed: '256', hp: '1001', crash_safety_rated: 'false', created_at: '2014-08-25 20:59:34 UTC' }
#     ]
#   end
#
#   context 'when exporting stream' do
#     it 'returns true for query class' do
#       Car.create!(hash_type_2)
#
#       ccsv = described_class.export(Car.all, stream: true)
#
#       expect(ccsv.is_a?(Enumerator)).to eq(true)
#     end
#   end
#
#   context 'when exporting csv all data' do
#     it 'to be an array of records from a Class dump' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_all_path)
#       ccsv = described_class.export(Car)
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'to be an array of records from a ActiveRelation dump' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_dump_path)
#       ccsv = described_class.export(Car.where(speed: 235..245))
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when exporting csv all data' do
#     it 'to be an array of records' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_all_path)
#       ccsv = described_class.export(Car.all)
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'record' do
#       Car.create!(hash_type_2)
#
#       sarr = File.read(solo_all_path)
#       ccsv = described_class.export(Car.first)
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when exporting csv only values' do
#     it 'to be an array of records' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_only_path)
#       ccsv = described_class.export(Car.all,
#                                     only: %i[id name])
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'record' do
#       Car.create!(hash_type_2)
#
#       sarr = File.read(solo_only_path)
#       ccsv = described_class.export(Car.first,
#                                     only: :name)
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when exporting csv except values' do
#     it 'to be an array of records' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_except_path)
#       ccsv = described_class.export(Car.all,
#                                     except: %i[id name])
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'record' do
#       Car.create!(hash_type_2)
#
#       sarr = File.read(solo_except_path)
#       ccsv = described_class.export(Car.first,
#                                     except: :name)
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when exporting csv with headers' do
#     it 'to be an array of records' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_headers_path)
#       ccsv = described_class.export(Car.all,
#                                     headers: header_2)
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'record' do
#       Car.create!(hash_type_2)
#
#       sarr = File.read(solo_headers_path)
#       ccsv = described_class.export(Car.first,
#                                     headers: header_2)
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when exporting csv with options' do
#     it 'to be an array of records' do
#       hash_type_1.each { |v| Car.create!(v) }
#
#       sarr = File.read(multi_options_path)
#       ccsv = described_class.export(Car.all,
#                                     options: options)
#
#       expect(ccsv).to eq(sarr)
#     end
#
#     it 'record' do
#       Car.create!(hash_type_2)
#
#       sarr = File.read(solo_options_path)
#       ccsv = described_class.export(Car.first,
#                                     options: options)
#
#       expect(ccsv).to eq(sarr)
#     end
#   end
#
#   context 'when importing csv without headers to create' do
#     it '3 cars' do
#       described_class.import(multi_all_path,
#                              model: Car)
#
#       expect(Car.count).to eq(3)
#     end
#
#     it '1 car' do
#       described_class.import(solo_all_path,
#                              model: Car)
#
#       expect(Car.count).to eq(1)
#     end
#   end
#
#   context 'when importing csv with headers to create' do
#     it '3 cars' do
#       described_class.import(multi_headerless_path,
#                              model: Car,
#                              headers: header_1)
#
#       expect(Car.count).to eq(3)
#     end
#
#     it '1 car' do
#       described_class.import(solo_headerless_path,
#                              model: Car,
#                              headers: header_1)
#
#       expect(Car.count).to eq(1)
#     end
#   end
#
#   context 'when importing csv only values to create' do
#     it '3 cars' do
#       described_class.import(multi_headerless_path,
#                              model: Car,
#                              headers: header_1,
#                              only: :name)
#
#       expect(Car.where.not(name: nil).count).to eq(3)
#     end
#
#     it '1 car' do
#       described_class.import(solo_headerless_path,
#                              model: Car,
#                              headers: header_1,
#                              only: :name)
#
#       expect(Car.where.not(name: nil).count).to eq(1)
#     end
#   end
#
#   context 'when importing csv except values to create' do
#     it '3 cars' do
#       described_class.import(multi_headerless_path,
#                              model: Car,
#                              headers: header_1,
#                              except: :name)
#
#       expect(Car.where(name: nil).count).to eq(3)
#     end
#
#     it '1 car' do
#       described_class.import(solo_headerless_path,
#                              model: Car,
#                              headers: header_1,
#                              except: :name)
#
#       expect(Car.where(name: nil).count).to eq(1)
#     end
#   end
#
#   context 'when importing csv with options to create' do
#     it '3 cars' do
#       described_class.import(multi_headerless_options_path,
#                              model: Car,
#                              headers: header_1,
#                              options: options)
#
#       expect(Car.count).to eq(3)
#     end
#
#     it '1 car' do
#       described_class.import(solo_headerless_options_path,
#                              model: Car,
#                              headers: header_1,
#                              options: options)
#
#       expect(Car.count).to eq(1)
#     end
#   end
#
# end
