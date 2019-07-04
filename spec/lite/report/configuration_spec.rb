# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Configuration do
  after(:all) do
    Lite::Report.configure do |config|
      config.csv_force_encoding = true
      config.csv_options = { external_encoding: 'ISO-8859-1', internal_encoding: 'UTF-8' }
      config.import_adapter = nil
      config.import_options = { validate: false, on_duplicate_key_ignore: true }
    end
  end

  describe '#configure' do
    it 'to be "foo" for csv_force_encoding' do
      Lite::Report.configuration.csv_force_encoding = 'foo'

      expect(Lite::Report.configuration.csv_force_encoding).to eq('foo')
    end

    it 'to be "foo" for csv_options' do
      Lite::Report.configuration.csv_options = 'foo'

      expect(Lite::Report.configuration.csv_options).to eq('foo')
    end

    it 'to be "foo" for import_adapter' do
      Lite::Report.configuration.import_adapter = 'foo'

      expect(Lite::Report.configuration.import_adapter).to eq('foo')
    end

    it 'to be "foo" for import_options' do
      Lite::Report.configuration.import_options = 'foo'

      expect(Lite::Report.configuration.import_options).to eq('foo')
    end
  end

end
