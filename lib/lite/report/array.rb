# frozen_string_literal: true

class Lite::Report::Array < Lite::Report::Base

  def export
    build_first_csv_structure!
    stream_or_generate_export!
  end

  private

  def generate_export!
    CSV.generate(@csv_options) do |csv|
      @data.each { |row| csv << row }
    end
  end

  def stream_export!
    Enumerator.new do |csv|
      @data.each { |row| csv << CSV.generate_line(row, @csv_options) }
    end
  end

end
