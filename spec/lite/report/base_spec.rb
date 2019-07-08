# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Base do

  context 'when exporting an array csv' do
    it 'to be with col_sep csv option' do
      export!(
        klass: Lite::Report::Array,
        filename: :options,
        data: array,
        csv_options: {
          write_headers: true,
          headers: header_1,
          col_sep: ';'
        }
      )
    end
  end

  context 'when importing an array csv' do
    it 'to be with col_sep csv option' do
      import!(
        klass: Lite::Report::Array,
        template: array,
        filename: :options,
        csv_options: {
          headers: true,
          col_sep: ';'
        }
      )
    end
  end

end
