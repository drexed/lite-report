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
                 row = encode!(row) if encode?
                 row = typecast!(row) if typecast?

                 array.push(row)
               end

    normalize_data_dimensions!
  end

  private

  def normalize_data_dimensions!
    return @data unless @data.size < 2

    @data.flatten
  end

end
