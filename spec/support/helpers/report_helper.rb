# frozen_string_literal: true

module ReportHelper

  extend RSpec::SharedContext

  let(:header_1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header_2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
  end

  let(:only_except) do
    [0, 1]
  end
  let(:only) do
    header_1.select.with_index { |_, i| only_except.include?(i) }
  end
  let(:except) do
    header_1.reject.with_index { |_, i| only_except.include?(i) }
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
      Hash[header_1.zip(row)]
    end
  end
  let(:hash_only) do
    hash_headers.map do |row|
      row.select { |key, val| only.include?(key) }
    end
  end
  let(:hash_except) do
    hash_headers.map do |row|
      row.select { |key, val| except.include?(key) }
    end
  end

end
