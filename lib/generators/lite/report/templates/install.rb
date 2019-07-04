# frozen_string_literal: true

Lite::Report.configure do |config|
  config.csv_force_encoding = true
  config.csv_options = { external_encoding: 'ISO-8859-1', internal_encoding: 'UTF-8' }
  config.import_adapter = nil
  config.import_options = { validate: false, on_duplicate_key_ignore: true }
end
