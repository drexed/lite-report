# frozen_string_literal: true

class Lite::Report::Hash < Lite::Report::Base

  def export
    assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  def import
    CSV.foreach(@data, **@csv_options)
       .with_object([]) do |row, array|
         next if header_row?(row)

         row = convert_to_hash!(row)
         array << process_import_row!(row)
       end
  end

  private

  def assign_headers_to_csv_options!
    return unless write_headers?

    @csv_options[:headers] ||= @data.first.keys
  end

end
