# frozen_string_literal: true

module ReportHelper

  extend RSpec::SharedContext

  # TODO:  remove this
  let(:multi_headerless_options_path) { 'spec/support/fixtures/csv/multi_headerless_options.csv' }
  let(:multi_headerless_path) { 'spec/support/fixtures/csv/multi_headerless.csv' }
  let(:multi_headers_path) { 'spec/support/fixtures/csv/multi_headers.csv' }
  let(:multi_options_path) { 'spec/support/fixtures/csv/multi_options.csv' }
  let(:multi_except_path) { 'spec/support/fixtures/csv/multi_except.csv' }
  let(:multi_only_path) { 'spec/support/fixtures/csv/multi_only.csv' }
  let(:multi_dump_path) { 'spec/support/fixtures/csv/multi_dump.csv' }
  let(:multi_all_path) { 'spec/support/fixtures/csv/multi_all.csv' }

  let(:solo_headerless_options_path) { 'spec/support/fixtures/csv/solo_headerless_options.csv' }
  let(:solo_headerless_path) { 'spec/support/fixtures/csv/solo_headerless.csv' }
  let(:solo_headers_path) { 'spec/support/fixtures/csv/solo_headers.csv' }
  let(:solo_options_path) { 'spec/support/fixtures/csv/solo_options.csv' }
  let(:solo_except_path) { 'spec/support/fixtures/csv/solo_except.csv' }
  let(:solo_only_path) { 'spec/support/fixtures/csv/solo_only.csv' }
  let(:solo_all_path) { 'spec/support/fixtures/csv/solo_all.csv' }

  let(:options) do
    { col_sep: ';' }
  end

  let(:only_except_1) do
    %w[Name]
  end
  let(:only_except_2) do
    %w[Id Name]
  end

  let(:header_type_1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header_type_2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
  end

  let(:multi_array_typecast) do
    [
      [1, 'Ferrari', 235, 630, true, '2014-08-23T20:59:34.000Z'],
      [2, 'Lamborghini', 245, 720, true, '2014-08-24T20:59:34.000Z'],
      [3, 'Bugatti', 256, 1001, false, '2014-08-25T20:59:34.000Z']
    ]
  end
  let(:multi_array_string) do
    multi_array_typecast.map do |array|
      array.map(&:to_s)
    end
  end

  let(:solo_array_typecast) do
    [1, 'Porche', 225, 430, true, '2014-08-22T20:59:34.000Z']
  end
  let(:solo_array_string) do
    solo_array_typecast.map(&:to_s)
  end

end
