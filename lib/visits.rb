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

  # Returns a collection of visits that match the given route
  def for_route(route)
    visits.select { |visit| visit.route.match(route) }
  end

  # Returns a hash of visits where the key is a unique route and the value is
  # all visitors that visited that route
  def by_route
    grouped_visits = {}
    visits.each do |visit|
      grouped_visits[visit.route] ||= []
      grouped_visits[visit.route] << visit.visitor
    end
    grouped_visits
  end

  # Returns a collection of visits from the given visitor
  def for_visitor(visitor)
    visits.select { |visit| visit.visitor == visitor }
  end

  # Returns a hash of visits where the key is a unique visitor and the value is
  # all routes visited by that visitor
  def by_visitor
    grouped_visits = {}
    visits.each do |visit|
      grouped_visits[visit.visitor] ||= []
      grouped_visits[visit.visitor] << visit.route
    end
    grouped_visits
  end
end
