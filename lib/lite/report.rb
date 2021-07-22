# frozen_string_literal: true

require 'csv' unless defined?(CSV)

require 'generators/lite/report/install_generator' if defined?(Rails::Generators)

require 'lite/report/version'
require 'lite/report/configuration'
require 'lite/report/helpers/converters'
require 'lite/report/helpers/encoders'
require 'lite/report/helpers/filters'
require 'lite/report/helpers/headers'
require 'lite/report/helpers/processors'
require 'lite/report/helpers/records'
require 'lite/report/helpers/transporters'
require 'lite/report/base'
require 'lite/report/array'
require 'lite/report/hash'
require 'lite/report/record'
require 'lite/report/exporter'
