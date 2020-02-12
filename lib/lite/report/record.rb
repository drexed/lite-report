# frozen_string_literal: true

require 'active_record'
require 'activerecord-import'
require 'deep_pluck'

class Lite::Report::Record < Lite::Report::Base

  def export
    assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  def import
    assert_klass_data_option!
    assign_import_csv_options!

    @data = Lite::Report::Hash.import(@data, csv_options: @csv_options, data_options: @data_options)
                              .each { |row| row.delete(:id) || row.delete('id') }

    klass.import(@data, @import_options)
  end

  private

  def assert_klass_data_option!
    return if klass

    raise ArgumentError, '":klass" data_option is required'
  end

  def assign_headers_to_csv_options!
    return unless write_headers?

    @csv_options[:headers] ||= class_columns(@data)
  end

  def assign_import_csv_options!
    @csv_options[:headers] ||= class_columns(klass)
  end

  def assign_export_data!
    columns = class_columns(@data)
    @data = @data.result if ransack_class?(@data)
    @data = @data.deep_pluck(*columns)
    @data = [@data] unless @data.is_a?(Array)
  end

  def generate_export!
    assign_export_data!
    super
  end

  def stream_export!
    assign_export_data!
    super
  end

end
