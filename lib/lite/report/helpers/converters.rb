# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Converters

        private

        def convert_to_array!(row)
          case row.class.name
          when 'CSV::Row' then row.fields
          else row
          end
        end

        def convert_to_hash!(row)
          case row.class.name
          when 'CSV::Row' then row.to_hash
          else row
          end
        end

      end
    end
  end
end
