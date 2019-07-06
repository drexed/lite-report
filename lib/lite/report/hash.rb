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

    hash = @csv_options[:headers] || (@data.is_a?(Hash) ? @data : @data.first)
    hash = filter_hash!(hash)

    @csv_options[:headers] = hash.keys.map { |header| humanize!(header) }
  end

end
