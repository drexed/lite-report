# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Records

        private

        def active_record_table_object?(object)
          return if object.nil?

          !object.respond_to?(:table_name)
        end

        def active_record_table_class?(object)
          return if object.nil? || active_relation_object?(object)

          object.respond_to?(:table_name) || ransack_object?(object)
        end

        def active_record_column_names(object)
          return object.klass.column_names if ransack_object?(object)

          object.column_names
        end

        def active_relation_object?(object)
          object.is_a?(ActiveRecord::Relation)
        end

      end
    end
  end
end
