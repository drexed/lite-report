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

  def encode?(delete: false)
    return @data_options.delete(:encode) if delete

    @data_options[:encode]
  end

  def encode!(row)
    row.map do |cell|
      next if cell.nil?

      cell.tr('"', '').encode!(*@data_options[:encode])
    end
  end

  def generate_export!
    CSV.generate(@csv_options) do |csv|
      @data.each { |row| csv << row }
    end
  end

  def headers?(delete: false)
    return @csv_options.delete(:headers) if delete

    @csv_options[:headers]
  end

  def stream?(delete: false)
    return @csv_options.delete(:stream) if delete

    @csv_options[:stream]
  end

  def stream_export!
    Enumerator.new do |csv|
      csv << CSV.generate_line(headers?(delete: true)) if write_headers?(delete: true)

      @data.each { |row| csv << CSV.generate_line(row, @csv_options) }
    end
  end

  def stream_or_generate_export!
    return stream_export! if stream?(delete: true)

    generate_export!
  end

  def typecast?(delete: false)
    return @data_options.delete(:typecast) if delete

    @data_options[:typecast]
  end

  def typecast!(row)
    return row if row.empty?

    typecast_nested_values!(row)
  end

  def typecast_array_values!(row)
    row.map { |cell| typecast_value!(cell) }
  end

  def typecast_hash_values!(row)
    row.each { |column, cell| row[column] = typecast_value!(cell) }
  end

  def typecast_nested_values!(row)
    case row.class.name
    when 'Array' then typecast_array_values!(row)
    when 'Hash' then typecast_hash_values!(row)
    else typecast_value!(row)
    end
  end

  def typecast_value!(cell)
    SafeRuby.eval(cell.to_s, timeout: 1)
  rescue Exception
    cell
  end

  def write_headers?(delete: false)
    return @csv_options.delete(:write_headers) if delete

    @csv_options[:write_headers]
  end

end
