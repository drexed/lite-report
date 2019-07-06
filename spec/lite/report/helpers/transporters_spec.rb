# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Transporters do

  context 'when exporting an array csv with stream csv option' do
    it 'to be an Enumarator object' do
      result = array.export(multi_array_1, csv_options: { stream: true })

      expect(result).to be_a(Enumerator)
    end
  end

end
