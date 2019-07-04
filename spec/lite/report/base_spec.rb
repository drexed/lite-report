# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Base do
  let(:klass) { Lite::Report::Array }

  context 'when streaming export' do
    it 'to be an Enumarator object' do
      result = klass.export(multi_array_typecast, stream: true)

      expect(result).to eq(Enumerator)
    end
  end

end
