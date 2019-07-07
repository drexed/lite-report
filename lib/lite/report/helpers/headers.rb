# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Headers

        private

        def header_row?(row)
          return false unless row.respond_to?(:header_row?)

          row.header_row?
        end

        def headers?(delete: false)
          return @csv_options.delete(:headers) if delete

          @csv_options[:headers]
        end

        def return_headers?(delete: false)
          return @csv_options.delete(:return_headers) if delete

          @csv_options[:return_headers]
        end

        def write_headers?(delete: false)
          return @csv_options.delete(:write_headers) if delete

          @csv_options[:write_headers]
        end

      end
    end
  end
end
