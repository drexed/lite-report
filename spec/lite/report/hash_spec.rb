# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Lite::Report::Hash do

  context 'when exporting a hash csv' do
    it 'to be without options' do
      export!(
        filename: :headerless,
        data: hash
      )
    end
  end

  context 'when importing a hash csv' do
    it 'to be without options' do
      import!(
        template: hash,
        filename: :headerless
      )
    end
  end

end
