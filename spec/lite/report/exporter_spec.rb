# frozen_string_literal: true

require 'spec_helper'

class FakeExporter < Lite::Report::Exporter

  private

  def serialize(record)
    {
      'Id' => record.id,
      'Speed' => record.speed
    }
  end

end

RSpec.describe Lite::Report::Exporter do
  let(:result_hash) do
    { 'Id' => 1, 'Speed' => 235 }
  end

  before do
    hash_records.each { |hash| Car.create!(hash) }
  end

  it 'to be raise an Lite::Report::Exporter::NotImplementedError' do
    expect do
      described_class.call(Car.all)
    end.to raise_error(Lite::Report::Exporter::NotImplementedError)
  end

  context 'when serializing an active record collection' do
    it 'to be an exact of match the result hash' do
      results = FakeExporter.call(Car.all)

      expect(results.first).to eq(result_hash)
    end
  end

  context 'when serializing an array of active record objects' do
    it 'to be an exact of match the result hash' do
      results = FakeExporter.call(Car.all.to_a)

      expect(results.first).to eq(result_hash)
    end
  end

  context 'when serializing a single active record object' do
    it 'to be an exact of match the result hash' do
      results = FakeExporter.call(Car.first)

      expect(results.first).to eq(result_hash)
    end
  end

end
