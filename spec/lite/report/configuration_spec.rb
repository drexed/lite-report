# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Configuration do
  after { Lite::Report.reset_configuration! }

  describe '#configure' do
    it 'to be "foo" for csv_options' do
      Lite::Report.configuration.csv_options = 'foo'

      expect(Lite::Report.configuration.csv_options).to eq('foo')
    end
  end

  describe '#reset_configuration!' do
    it 'to be true' do
      Lite::Report.configuration.csv_options = 'foo'
      Lite::Report.reset_configuration!

      expect(Lite::Report.configuration.csv_options.is_a?(Hash)).to eq(true)
    end
  end

end
