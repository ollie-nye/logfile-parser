# frozen_string_literal: true

require 'query'

# Returns the number of unique visitors for a given route
class UniqueVisitorsFor < Query
  def query
    count = visits.by_route[argument]&.uniq&.count || 0
    logger.info "  #{count} unique visitors for #{argument}"
  end
end
