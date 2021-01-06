# frozen_string_literal: true

class Lite::Report::Exporter

  class NotImplementedError < StandardError; end

  attr_reader :records

  def initialize(records)
    @records = records
  end

  class << self

    def call(records)
      instance = new(records)
      instance.call
    end

  end

  def call
    results = []

    if records.respond_to?(:find_each)
      records.find_each { |record| results << serialize(record) }
    elsif records.respond_to?(:each)
      records.each { |record| results << serialize(record) }
    else
      results << serialize(records)
    end

    results
  end

  private

  def serialize(record)
    raise NotImplementedError
  end

end
