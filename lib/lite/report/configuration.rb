# frozen_string_literal: true

module Lite
  module Report

    class Configuration

      attr_accessor :csv_force_encoding, :csv_options, :import_adapter, :import_options

      def initialize
        @csv_force_encoding = true
        @csv_options = { external_encoding: 'ISO-8859-1', internal_encoding: 'UTF-8' }
        @import_adapter = nil
        @import_options = { validate: false, on_duplicate_key_ignore: true }
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
