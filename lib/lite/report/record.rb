# frozen_string_literal: true

require 'json'
require 'active_record'

begin
  require 'activerecord-import'
rescue Gem::LoadError
  # Do nothing
end

class Lite::Report::Record < Lite::Report::Base

  def export
    # assign_headers_to_csv_options!
    generate_or_stream_export!
  end

  private

  def assign_headers_to_csv_options!
    return unless write_headers?

    @csv_options[:headers] ||= @data.attributes
  end

  def generate_export!
    # @data = @data.result if ransack_object?(@data)

    CSV.generate(@csv_options) do |csv|
      @data.find_each(@data_options[:find_each] || {}) do |record|
        csv << process_export_row!(record.attributes)
      end
    end
  end


  # def export_csv
  #   @data = @data.result if ransack_object?(@data)
  #
  #   CSV.generate(@opts[:options]) do |csv|
  #     csv << @opts[:headers]
  #
  #     @data.find_each(find_each_options) do |row|
  #       csv << filter_values(row.attributes)
  #     end
  #   end
  # end

end
