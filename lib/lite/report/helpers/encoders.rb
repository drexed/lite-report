# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Encoders

        private

        def encode(cell)
          return cell unless cell.is_a?(String)

          cell = cell.tr('"', '')
          return cell if @data_options[:encode].empty?

          cell.encode!(
            @data_options[:encode][0],
            @data_options[:encode][1],
            **@data_options[:encode][2]
          )
        end

        def encode?(delete: false)
          return @data_options.delete(:encode) if delete

          @data_options[:encode]
        end

        def encode!(row)
          case row.class.name
          when 'Hash' then encode_hash!(row)
          else encode_array!(row)
          end
        end

        def encode_array!(row)
          row.map { |cell| encode(cell) }
        end

        def encode_hash!(row)
          row.map.with_object({}) do |(key, val), hash|
            hash[encode(key)] = encode(val)
          end
        end

      end
    end
  end
end
