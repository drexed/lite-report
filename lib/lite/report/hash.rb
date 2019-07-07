# frozen_string_literal: true

class Lite::Report::Hash < Lite::Report::Base

  def export
    build_csv_structure!
    assign_headers_option!
    stream_or_generate_export!
  end

  def import
    @data = CSV.foreach(@data, @csv_options)
               .with_object([]) do |row, array|
                 array << process_import_row!(row)
               end

    return @data unless @data.size == 1

    @data.first
  end

  private

  def assign_headers_option!
    return unless write_headers?

    hash = @csv_options[:headers] || (@data.is_a?(Hash) ? @data : @data.first)
    hash = filter_hash!(hash)

    @csv_options[:headers] = hash.keys.map { |header| humanize!(header) }
  end

end
