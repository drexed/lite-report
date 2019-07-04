# frozen_string_literal: true

module ReportHelper
  extend RSpec::SharedContext

  let(:options) do
    { col_sep: ';' }
  end

  let(:only_except_1) do
    ['Name']
  end
  let(:only_except_2) do
    ['Id', 'Name']
  end

  let(:header_type_1) do
    ['Id', 'Name', 'Speed', 'Hp', 'Crash safety rated', 'Created at']
  end
  let(:header_type_2) do
    ['No.', 'Model', 'Speed', 'Horse Power', 'Crash Safety Rated', 'Driven On']
  end

end
