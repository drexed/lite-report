# frozen_string_literal: true

require 'csv'

%w[version configuration base array hash record].each do |file_name|
  require "lite/report/#{file_name}"
end

require 'generators/lite/report/install_generator'
