# frozen_string_literal: true

class Lite::Report::Array < Lite::Report::Base

  def export
    build_first_csv_structure!
    stream_or_generate_export!
  end

  def import
    accumelator = build_array_structure_for(@csv_options.delete(:headers))

    @data = CSV.foreach(@data, @csv_options)
               .with_object(accumelator) do |row, array|
                 row = process_import_row!(row)

                 array.push(row)
               end

    return @data unless @data.size < 2

    @data.flatten
  end

end
