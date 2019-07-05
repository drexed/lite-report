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

    def self.configuration
      @configuration ||= Configuration.new
    end

    def self.configuration=(config)
      @configuration = config
    end

    def self.configure
      yield(configuration)
    end

  end
end
