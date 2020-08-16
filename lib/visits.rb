# frozen_string_literal: true

require 'visit'

# Aggregates multiple logfiles into a collection of Visit objects
class Visits
  attr_reader :visits

  def initialize
    @visits = []
  end

  # Parse a given filename. Will raise errors for incorrect format or File
  # exceptions
  def parse(filename)
    File.foreach(filename) do |line|
      @visits << Visit.new(line)
    end
  end

  # Returns a collection of visits for the given route
  def for_route(route)
    visits.select { |visit| visit.route == route }
  end

  # Returns a hash of visits where the key is a unique route and the value is
  # all visitors that visited that route
  def by_route
    group_by(subject: :route, property: :visitor)
  end

  # Returns a collection of visits from the given visitor
  def for_visitor(visitor)
    visits.select { |visit| visit.visitor == visitor }
  end

  # Returns a hash of visits where the key is a unique visitor and the value is
  # all routes visited by that visitor
  def by_visitor
    group_by(subject: :visitor, property: :route)
  end

  private

  # Groups visits by a given subject, returning an array of values obtained from
  # the given property
  def group_by(subject:, property:)
    {}.tap do |grouped_visits|
      visits.each do |visit|
        visitor = visit.public_send(subject)
        grouped_visits[visitor] ||= []
        grouped_visits[visitor] << visit.public_send(property)
      end
    end
  end
end
