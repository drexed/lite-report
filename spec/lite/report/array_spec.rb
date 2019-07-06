# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Array do

  context 'when exporting an array csv without options' do
    it 'to be an array of arrays' do
      export!(
        filename: :multi_headerless,
        data: multi_array_2
      )
    end

    it 'to be an array' do
      export!(
        filename: :solo_headerless,
        data: solo_array_2
      )
    end
  end

  context 'when importing an array csv without options' do
    it 'to be an array of arrays' do
      import!(
        template: multi_array_2,
        filename: :multi_headerless
      )
    end

    it 'to be an array' do
      import!(
        template: solo_array_2,
        filename: :solo_headerless
      )
    end
  end

end
