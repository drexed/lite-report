# frozen_string_literal: true

class Lite::Report::Array < Lite::Report::Base

  def export
    stream_or_generate_export!
  end

  def import
    CSV.foreach(@data, @csv_options)
       .with_object([]) do |row, array|
         row = convert_to_array!(row)
         array << process_import_row!(row)
       end
  end

end
