# frozen_string_literal: true

require 'json'
require 'active_record'

# TODO: Use ransack
# TODO: Use activerecord-import
# TODO: Use deep_pluck

class Lite::Report::Record < Lite::Report::Base

  def export
    # assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  private

  def assign_headers_to_csv_options!
    return unless write_headers?

    @csv_options[:headers] ||= @data.attributes
  end

  def generate_export!
    @data = @data.result if ransack_class?(@data)

    CSV.generate(@csv_options) do |csv|
      @data.deep_pluck('*') do |record|
        csv << process_export_row!(record.attributes)
      end
    end
  end

end
