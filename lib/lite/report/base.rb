# frozen_string_literal: true

class Lite::Report::Base

  def initialize(data, data_options: {}, csv_options: {})
    @data = data
    @data_options = data_options
    @csv_options = csv_options
  end

  class << self
    def export(data, data_options: {}, csv_options: {})
      klass = new(data, data_options: data_options, csv_options: csv_options)
      klass.export
    end

    def import(data, data_options: {}, csv_options: {})
      klass = new(data, data_options: data_options, csv_options: csv_options)
      klass.import
    end
  end

  private

  def build_array_structure_for(data)
    [data].compact
  end

  def build_csv_structure!
    return if @data.is_a?(Array)

    @data = build_array_structure_for(@data)
  end

  def build_first_csv_structure!
    return if @data.first.is_a?(Array)

    @data = build_array_structure_for(@data)
  end

  def stream?
    @csv_options[:stream]
  end

  def stream_or_generate_export!
    return stream_export! if stream?

    generate_export!
  end

end
