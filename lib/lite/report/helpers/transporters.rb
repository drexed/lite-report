# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Transporters

        private

        def generate_export!
          CSV.generate(@csv_options) do |csv|
            @data.each do |row|
              row = process_export_row!(row)

              csv << row
            end
          end
        end

        def stream?(delete: false)
          return @csv_options.delete(:stream) if delete

          @csv_options[:stream]
        end

        def stream_export!
          Enumerator.new do |csv|
            csv << CSV.generate_line(headers?(delete: true)) if write_headers?(delete: true)

            @data.each do |row|
              row = process_export_row!(row)

              csv << CSV.generate_line(row, @csv_options)
            end
          end
        end

        def stream_or_generate_export!
          return stream_export! if stream?(delete: true)

          generate_export!
        end

      end
    end
  end
end
