# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Configuration do
  after do
    Lite::Report.configure do |config|
      config.csv_options = {}
      config.data_options = {}
      config.import_options = {}
    end
  end

  describe '#configure' do
    it 'to be "foo" for csv_options' do
      Lite::Report.configuration.csv_options = 'foo'

      expect(Lite::Report.configuration.csv_options).to eq('foo')
    end

    it 'to be "foo" for data_options' do
      Lite::Report.configuration.data_options = 'foo'

      expect(Lite::Report.configuration.data_options).to eq('foo')
    end

    it 'to be "foo" for import_options' do
      Lite::Report.configuration.import_options = 'foo'

      expect(Lite::Report.configuration.import_options).to eq('foo')
    end
  end

end
