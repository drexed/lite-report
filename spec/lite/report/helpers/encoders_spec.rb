# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Encoders do

  context 'when importing an array csv with encode data options' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: multi_array_2,
        filename: :multi_headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: solo_array_2,
        filename: :solo_headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end
  end

end
