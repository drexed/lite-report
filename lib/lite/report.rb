# frozen_string_literal: true

require 'csv'
require 'lite/report/version'

%w[converters encoders filters headers processors records transporters].each do |file_name|
  require "lite/report/helpers/#{file_name}"
end

%w[configuration base array hash record].each do |file_name|
  require "lite/report/#{file_name}"
end

require 'generators/lite/report/install_generator'
