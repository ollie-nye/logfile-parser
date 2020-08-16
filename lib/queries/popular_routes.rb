# frozen_string_literal: true

require 'query'

# Returns all routes, sorted by most visits
class PopularRoutes < Query
  def query
    sorted_by_visits = visits.by_route.sort_by { |route, visitors| [-visitors.count, route] }
    sorted_by_visits.each do |route, visitors|
      logger.info "#{route}: #{visitors.count} visits, #{visitors.uniq.count} unique visitors"
    end
  end
end
