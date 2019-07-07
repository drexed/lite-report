# frozen_string_literal: true

class Lite::Report::Base
  include Lite::Report::Helpers::Converters
  include Lite::Report::Helpers::Encoders
  include Lite::Report::Helpers::Filters
  include Lite::Report::Helpers::Headers
  include Lite::Report::Helpers::Processors
  include Lite::Report::Helpers::Transporters

  def initialize(data, data_options: {}, csv_options: {})
    @data = data
    @data_options = data_options
    @csv_options = csv_options
  end

  class << self
    def export(data, data_options: {}, csv_options: {})
      klass = new(data, data_options: data_options, csv_options: csv_options)
      klass.export
    end

    def import(data, data_options: {}, csv_options: {})
      klass = new(data, data_options: data_options, csv_options: csv_options)
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
