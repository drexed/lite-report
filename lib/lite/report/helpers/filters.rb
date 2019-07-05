# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Filters

        private

        def except?(delete: false)
          return @data_options.delete(:except) if delete

          @data_options[:except]
        end

        def filter?(delete: false)
          only?(delete: delete) || except?(delete: delete)
        end

        def filter!(row)
          case row.class.name
          when 'Array' then filter_array!(row)
          when 'Hash' then filter_hash(row)
          end
        end

        def filter_array!(row)
          if @data_options[:only]
            row.keep_if.with_index { |_, i| @data_options[:only].include?(i) }
          elsif @data_options[:except]
            row.delete_if.with_index { |_, i| @data_options[:except].include?(i) }
          else
            row
          end
        end

        def filter_hash!(row)
          if @data_options[:only]
            row.keep_if { |key, _| @data_options[:only].include?(key) }
          elsif @data_options[:except]
            row.delete_if { |key, _| @data_options[:except].include?(key) }
          else
            row
          end
        end

        def only?(delete: false)
          return @data_options.delete(:only) if delete

          @data_options[:only]
        end

      end
    end
  end
end
