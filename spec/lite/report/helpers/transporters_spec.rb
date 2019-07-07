# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Transporters do

  context 'when exporting an array csv' do
    it 'to be without options' do
      result = Lite::Report::Array.export(array)

      expect(result).to be_a(String)
    end

    it 'to be with stream csv option' do
      result = Lite::Report::Array.export(array, csv_options: { stream: true })

      expect(result).to be_a(Enumerator)
    end
  end

end
