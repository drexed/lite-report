# frozen_string_literal: true

module ValidationHelper

  def export!(filename:, data:, data_options: {}, csv_options: {})
    template = File.read("spec/support/fixtures/csv/#{filename}.csv")
    results = described_class.export(
      data,
      data_options: data_options,
      csv_options: csv_options
    )

    expect(results).to eq(template)
  end

  def import!(template:, filename:, data_options: {}, csv_options: {})
    results = described_class.import(
      "spec/support/fixtures/csv/#{filename}.csv",
      data_options: data_options,
      csv_options: csv_options
    )

    expect(results).to eq(template)
  end

end
