# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Base do

  context 'when exporting an array csv with col_sep csv option' do
    it 'to be an array of arrays' do
      export!(
        klass: array,
        filename: :multi_options,
        data: multi_array_2,
        csv_options: {
          write_headers: true,
          headers: header_1,
          col_sep: ';'
        }
      )
    end

    it 'to be an array' do
      export!(
        klass: array,
        filename: :solo_options,
        data: solo_array_2,
        csv_options: {
          write_headers: true,
          headers: header_1,
          col_sep: ';'
        }
      )
    end
  end

end
