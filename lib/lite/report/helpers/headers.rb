# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Headers

        private

        def headers?(delete: false)
          return @csv_options.delete(:headers) if delete

          @csv_options[:headers]
        end

        def write_headers?(delete: false)
          return @csv_options.delete(:write_headers) if delete

          @csv_options[:write_headers]
        end

      end
    end
  end
end
