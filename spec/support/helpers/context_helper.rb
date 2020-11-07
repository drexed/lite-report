# frozen_string_literal: true

module ContextHelper

  extend RSpec::SharedContext

  let(:header1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
  end

  let(:only_except) do
    [0, 1]
  end
  let(:only) do
    header1.select.with_index { |_, i| only_except.include?(i) }
  end
  let(:except) do
    header1.reject.with_index { |_, i| only_except.include?(i) }
  end
  let(:only_columns) do
    only.map { |cell| cell.downcase.tr(' ', '_') }
  end
  let(:except_columns) do
    except.map { |cell| cell.downcase.tr(' ', '_') }
  end

  let(:array) do
    [
      ['1', 'Ferrari', '235', '630', 'true', '2014-08-23 20:59:34 UTC'],
      ['2', 'Lamborghini', '245', '720', 'true', '2014-08-24 20:59:34 UTC'],
      ['3', 'Bugatti', '256', '1001', 'false', '2014-08-25 20:59:34 UTC']
    ]
  end
  let(:array_only) do
    array.map do |row|
      row.select.with_index { |_, i| only_except.include?(i) }
    end
  end
  let(:array_except) do
    array.map do |row|
      row.reject.with_index { |_, i| only_except.include?(i) }
    end
  end

  let(:hash) do
    array.map do |row|
      Hash[(0..(row.size - 1)).zip(row)]
    end
  end
  let(:hash_headers) do
    array.map do |row|
      Hash[header1.zip(row)]
    end
  end
  let(:hash_records) do
    array.map do |row|
      Hash[header1.map { |key| key.downcase.tr(' ', '_') }.zip(row)]
    end
  end
  let(:hash_only) do
    hash_headers.map do |row|
      row.select { |key, _| only.include?(key) }
    end
  end
  let(:hash_except) do
    hash_headers.map do |row|
      row.select { |key, _| except.include?(key) }
    end
  end

  let(:active_record) do
    Car
  end
  let(:active_relation) do
    Car.where(speed: 0..999)
  end
  let(:instance) do
    Car.first
  end
  let(:ransack) do
    Car.ransack(speed_gt: 0)
  end

end
