# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Helpers::Typecasters do

  context 'when importing an array csv with typecast data option' do
    it 'to be an array of arrays' do
      import!(
        klass: array,
        template: multi_array_1,
        filename: :multi_headerless,
        data_options: { typecast: true }
      )
    end

    it 'to be an array' do
      import!(
        klass: array,
        template: solo_array_1,
        filename: :solo_headerless,
        data_options: { typecast: true }
      )
    end
  end

end
