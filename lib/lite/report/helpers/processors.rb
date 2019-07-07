# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Processors

        private

        def process_export_row!(row)
          row = filter!(row) if filter?
          row = encode!(row) if encode?
          row
        end

        def process_import_row!(row)
          row = filter!(row) if filter?
          row = encode!(row) if encode?
          row
        end

      end
    end
  end
end
