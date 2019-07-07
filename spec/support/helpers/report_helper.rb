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

end
