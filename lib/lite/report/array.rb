# frozen_string_literal: true

class Lite::Report::Array < Lite::Report::Base

  def export
    build_first_csv_structure!
    stream_or_generate_export!
  end

  def import
    @data = CSV.foreach(@data, @csv_options).with_object([]) do |row, array|
      # row = force_encode_utf8!(row) if force_encode_utf8?
      row = typecast!(row) if typecast?

      array.push(row)
    end

    return @data unless @data.size < 2

    @data.flatten
  end

end
