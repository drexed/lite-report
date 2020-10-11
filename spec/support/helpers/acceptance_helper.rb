# frozen_string_literal: true

module AcceptanceHelper

  def export!(filename:, data:, klass: nil, data_options: {}, csv_options: {})
    template = File.read("spec/support/fixtures/csv/#{filename}.csv")
    results = (klass || described_class).export(
      data,
      data_options: data_options,
      csv_options: csv_options
    )

    expect(results).to eq(template)
  end

  def import!(template:, filename:, klass: nil, data_options: {}, csv_options: {})
    results = (klass || described_class).import(
      "spec/support/fixtures/csv/#{filename}.csv",
      data_options: data_options,
      csv_options: csv_options
    )

    expect(results).to eq(template)
  end

end
