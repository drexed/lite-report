# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Converters

        private

        def convert_to_array!(row)
          row.fields
        end

        def convert_to_hash!(row)
          row.to_hash
        end

      end
    end
  end
end
