# frozen_string_literal: true

class Lite::Report::Hash < Lite::Report::Base

  def export
    generate_or_stream_export!
  end

  def import
    CSV.foreach(@data, @csv_options)
       .with_object([]) do |row, array|
         row = convert_to_hash!(row)
         array << process_import_row!(row)
       end
  end

end
