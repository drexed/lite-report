# frozen_string_literal: true

module ReportHelper

  extend RSpec::SharedContext

  let(:header_1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header_2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
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

  let(:only_except_1) do
    %w[Name]
  end
  let(:only_except_2) do
    %w[Id Name]
  end

end
