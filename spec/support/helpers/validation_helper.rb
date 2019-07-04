# frozen_string_literal: true

module ValidationHelper

  def export!(filename, collection, opts = {})
    data = described_class.export(collection, opts)
    file = File.read("spec/support/fixtures/csv/#{filename}.csv")
    expect(data).to eq(file)
  end

  def import!(actual, filename, **opts)
    data = described_class.import("spec/support/fixtures/csv/#{filename}.csv", opts)
    expect(data).to eq(actual)
  end

end
