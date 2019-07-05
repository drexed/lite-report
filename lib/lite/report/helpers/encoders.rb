# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Encoders

        private

        def encode?(delete: false)
          return @data_options.delete(:encode) if delete

          @data_options[:encode]
        end

        def encode!(row)
          row.map do |cell|
            next if cell.nil?

            cell.tr('"', '').encode!(*@data_options[:encode])
          end
        end

      end
    end
  end
end
