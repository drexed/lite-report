# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Typecasters

        private

        def typecast?(delete: false)
          return @data_options.delete(:typecast) if delete

          @data_options[:typecast]
        end

        def typecast!(row)
          return row if row.empty?

          typecast_nested_values!(row)
        end

        def typecast_array_values!(row)
          row.map { |cell| typecast_value!(cell) }
        end

        def typecast_hash_values!(row)
          row.each { |column, cell| row[column] = typecast_value!(cell) }
        end

        def typecast_nested_values!(row)
          case row.class.name
          when 'Array' then typecast_array_values!(row)
          when 'Hash' then typecast_hash_values!(row)
          else typecast_value!(row)
          end
        end

        def typecast_value!(cell)
          SafeRuby.eval(cell.to_s, timeout: 1)
        rescue Exception
          cell
        end

      end
    end
  end
end
