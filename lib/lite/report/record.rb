# frozen_string_literal: true

require 'active_record' unless defined?(ActiveRecord)

class Lite::Report::Record < Lite::Report::Base

  def export
    assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  def import
    assert_klass_data_option!
    assign_import_csv_options!

    @data = Lite::Report::Hash.import(@data, csv_options: @csv_options, data_options: @data_options)
                              .each do |row|
                                row.delete(:id) || row.delete('id')
                                (row['created_at'] ||= timestamp) if created_at_timestamp?
                                (row['updated_at'] ||= timestamp) if updated_at_timestamp?
                              end

    klass.insert_all(@data, **@import_options)
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
    @data = if ransack_class?(@data)
              @data.result
            elsif @data.try(:persisted?)
              Array(@data)
            else
              @data
            end

    @data = @data.pluck(*columns).map { |values| columns.zip(values).to_h }
  end

  def generate_export!
    assign_export_data!
    super
  end

  def stream_export!
    assign_export_data!
    super
  end

  def timestamp
    @timestamp ||= Time.try(:current) || Time.now
  end

  def created_at_timestamp?
    return @created_at_timestamp if defined?(@created_at_timestamp)

    @created_at_timestamp = klass.new.respond_to?(:created_at)
  end

  def updated_at_timestamp?
    return @updated_at_timestamp if defined?(@updated_at_timestamp)

    @updated_at_timestamp = klass.new.respond_to?(:updated_at)
  end

end
