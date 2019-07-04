# frozen_string_literal: true

module ValidationHelper

  def export!(type, name, collection, **opts)
    file = File.read("spec/support/fixtures/csv/#{filename}.csv")
    data = klass(type).export(collection, opts)
    expect(data).to eq(file)
  end

  def import!(type, actual, filename, **opts)
    data = klass(type).import("spec/support/fixtures/csv/#{filename}.csv", opts)
    expect(data).to eq(actual)
  end

  private

  def klass(type)
    case type
    when :array then Lite::Report::Array
    when :hash then Lite::Report::Hash
    when :record then Lite::Report::Record
    end
  end

end
