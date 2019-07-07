# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Encoders do

  context 'when importing an array csv with encode data options' do
    it 'to be an array of arrays' do
      import!(
        klass: Lite::Report::Array,
        template: array,
        filename: :headerless,
        data_options: {
          encode: ['UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '']
        }
      )
    end
  end

end
