# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  context 'when exporting an array csv without options' do
    it 'to be an array of arrays' do
      export!(
        filename: :headerless,
        data: array
      )
    end
  end

  context 'when importing an array csv without options' do
    it 'to be an array of arrays' do
      import!(
        template: array,
        filename: :headerless
      )
    end
  end

end
