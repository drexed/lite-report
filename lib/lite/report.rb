# frozen_string_literal: true

require 'csv' unless defined?(CSV)

require 'generators/lite/report/install_generator' if defined?(Rails::Generators)

require 'lite/report/version'

%w[converters encoders filters headers processors records transporters].each do |file_name|
  require "lite/report/helpers/#{file_name}"
end

%w[configuration base array hash record exporter].each do |file_name|
  require "lite/report/#{file_name}"
end
