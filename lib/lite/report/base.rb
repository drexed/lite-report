# frozen_string_literal: true

class Lite::Report::Base

  include Lite::Report::Helpers::Converters
  include Lite::Report::Helpers::Encoders
  include Lite::Report::Helpers::Filters
  include Lite::Report::Helpers::Headers
  include Lite::Report::Helpers::Processors
  include Lite::Report::Helpers::Records
  include Lite::Report::Helpers::Transporters

  def initialize(data, csv_options: {}, data_options: {}, import_options: {})
    @data = data
    @csv_options = Lite::Report.configuration.csv_options.merge(csv_options)
    @data_options = Lite::Report.configuration.data_options.merge(data_options)
    @import_options = Lite::Report.configuration.import_options.merge(import_options)
  end

  class << self

    def export(data, csv_options: {}, data_options: {}, import_options: {})
      klass = new(
        data,
        csv_options: csv_options,
        data_options: data_options,
        import_options: import_options
      )

      klass.export
    end

    def import(data, csv_options: {}, data_options: {}, import_options: {})
      klass = new(
        data,
        csv_options: csv_options,
        data_options: data_options,
        import_options: import_options
      )

      klass.import
    end

  end

  private

  def values!(row)
    case row.class.name
    when 'CSV::Row' then row.fields
    when 'Hash' then row.values
    else row
    end
  end

end
