# frozen_string_literal: true

require 'query'

# Returns the number of unique visitors for all routes
class UniqueVisitors < Query
  def query
    visits.by_route.sort.each do |route, visitors|
      logger.info "  #{visitors.uniq.count} unique visitors for #{route}"
    end
  end
end
