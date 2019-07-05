# frozen_string_literal: true

class Lite::Report::Hash < Lite::Report::Base

  def export
    build_csv_structure!
    assign_headers_option!
    stream_or_generate_export!
  end

  def import

  end

  private

  def assign_headers_option!
    return unless write_headers?

    @csv_options[:headers] ||= begin
      hash = @data.first unless @data.is_a?(Hash)
      hash = filter_hash!(hash)

      hash.keys.map { |header| humanize!(header) }
    end
  end

end
