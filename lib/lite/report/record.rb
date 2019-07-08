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
                              .each_with_object([]) do |row, array|
                                row.delete(:id)
                                array << row
                              end

    klass.import(@data) # .import(@data, import_options)
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

  def generate_export!
    columns = class_columns(@data)
    @data = @data.result if ransack_class?(@data)
    @data = @data.deep_pluck(*columns)

    super
  end

end
