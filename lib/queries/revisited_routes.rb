# frozen_string_literal: true

require 'query'

# Returns routes with at least one revisitor, sorted alphabetically
class RevisitedRoutes < Query
  def query
    visits.by_route.sort.each do |route, visitors|
      revisits = revisited_visitors(visitors)
      next unless revisits.keys.any?

      revisitors = revisits.length
      revisit_count = (revisits.values.reduce(&:+) || 0) - revisitors
      logger.info "#{route}: #{revisitors} revisitors, #{revisit_count} revisits"
    end
  end

  private

  # Returns a hash of routes with at least one revisit, along with the list of visitors
  def revisited_visitors(visitors)
    visitor_visit_counts = visitors.group_by { |visitor| visitor }.transform_values(&:length)
    visitor_visit_counts.select { |_, visitor_count| visitor_count > 1 }
  end
end
