# frozen_string_literal: true

module Lite
  module Report

    class Configuration

      attr_accessor :csv_options, :data_options, :import_options

      def initialize
        @csv_options = {}
        @data_options = {}
        @import_adapter = {}
      end

    end

    class << self

      attr_writer :configuration

      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield(configuration)
      end

      def reset_configuration!
        @configuration = Configuration.new
      end

    end

  end
end
