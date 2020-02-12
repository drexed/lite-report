# frozen_string_literal: true

module Lite
  module Report
    module Helpers
      module Records

        private

        def class_columns(data)
          return data.klass.column_names if ransack_class?(data)

          data.try(:column_names) || data.class.column_names
        end

        def klass
          @data_options[:klass]
        end

        def ransack_class?(data)
          return false unless defined?(Ransack)

          data.is_a?(Ransack::Search)
        end

      end
    end
  end
end
