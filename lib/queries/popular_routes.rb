# frozen_string_literal: true

# Returns all routes, sorted by most visits
class PopularRoutes
  def self.query(visits, _)
    output = ''
    sorted_by_visits = visits.by_route.sort_by { |k, v| [-v.count, k] }
    sorted_by_visits.map do |route, visitors|
      output += "#{route}: #{visitors.count} visits, #{visitors.uniq.count} unique visitors\n"
    end
    output
  end
end
