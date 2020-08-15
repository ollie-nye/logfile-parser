# frozen_string_literal: true

# Returns the number of unique visitors for a given route
class UniqueVisitorsFor
  def self.query(visits, route)
    count = visits.by_route[route]&.uniq&.count || 0
    "#{count} unique visitors for #{route}"
  end
end
