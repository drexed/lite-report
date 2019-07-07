# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Records

        private

        def active_record_table_data?(data)
          return if data.nil?

          !data.respond_to?(:table_name)
        end

        def active_record_table_class?(data)
          return if data.nil? || active_relation_data?(data)

          data.respond_to?(:table_name) || ransack_data?(data)
        end

        def active_record_column_names(data)
          return data.klass.column_names if ransack_data?(data)

          data.column_names
        end

        def active_relation_data?(data)
          data.is_a?(ActiveRecord::Relation)
        end

        def ransack_class?(data)
          return false unless defined?(Ransack)

          data.is_a?(Ransack::Search)
        end

      end
    end
  end
end
