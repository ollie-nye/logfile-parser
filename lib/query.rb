# frozen_string_literal: true

require 'logger'

# Base query class providing a wrapper for other queries. Creates a logger if
# one has not been provided
class Query
  attr_reader :visits, :argument, :logger

  def self.query(visits, argument, logger: nil)
    logger ||= Logger.new($stdout)

    new(visits, argument, logger).tap(&:query)
  end

  def query
    logger.warn 'This method cannot be called outside of a query.'
  end

  private

  def initialize(visits, argument, logger)
    @visits = visits
    @argument = argument
    @logger = logger
  end
end
