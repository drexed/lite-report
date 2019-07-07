# frozen_string_literal: true

require 'json'
require 'active_record'
require 'deep_pluck'

# TODO: Use activerecord-import

class Lite::Report::Record < Lite::Report::Base

  def export
    assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  private

  def assign_headers_to_csv_options!
    return unless write_headers?

    @csv_options[:headers] ||= class_columns(@data)
  end

  def generate_export!
    columns = class_columns(@data)
    @data = @data.result if ransack_class?(@data)
    @data = @data.deep_pluck(*columns)

    super
  end

end
