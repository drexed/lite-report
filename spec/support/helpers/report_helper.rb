# frozen_string_literal: true

module ReportHelper

  extend RSpec::SharedContext

  let(:array) { Lite::Report::Array }
  let(:hash) { Lite::Report::Hash }
  let(:report) { Lite::Report::Report }

  let(:header_1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header_2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
  end

  let(:only_except_1) do
    %w[Name]
  end
  let(:only_except_2) do
    %w[Id Name]
  end

  let(:multi_array_1) do
    [
      [1, 'Ferrari', 235, 630, true, '2014-08-23 20:59:34 UTC'],
      [2, 'Lamborghini', 245, 720, true, '2014-08-24 20:59:34 UTC'],
      [3, 'Bugatti', 256, 1001, false, '2014-08-25 20:59:34 UTC']
    ]
  end
  let(:multi_array_2) do
    multi_array_1.map do |array|
      array.map(&:to_s)
    end
  end

  let(:solo_array_1) do
    [1, 'Porche', 225, 430, true, '2014-08-22 20:59:34 UTC']
  end
  let(:solo_array_2) do
    solo_array_1.map(&:to_s)
  end

  let(:multi_hash_1) do
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
  let(:multi_hash_2) do
    multi_hash_1.map do |hash|
      hash.deep_merge(hash) { |_, _, v| v.to_s }
    end
  end

  let(:solo_hash_1) do
    {
      'Id' => 1, 'Name' => 'Porche', 'Speed' => 225, 'Hp' => 430,
      'Crash safety rated' => true, 'Created at' => '2014-08-22 20:59:34 UTC'
    }
  end
  let(:solo_hash_2) do
    solo_hash_1.deep_merge(solo_hash_1) { |_, _, v| v.to_s }
  end

end
