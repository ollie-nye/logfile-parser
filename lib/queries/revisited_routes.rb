# frozen_string_literal: true

# Returns routes with at least one revisitor, sorted alphabetically
class RevisitedRoutes
  def self.query(visits, _)
    output = ''
    visits.by_route.sort.each do |route, visitors|
      revisits = revisited_visitors(visitors)
      next unless revisits.keys.any?

      revisit_count = (revisits.values.reduce(&:+) || 0) - revisits.length
      output += "#{route}: #{revisits.length} revisitors, #{revisit_count} revisits\n"
    end
    output
  end

  def self.revisited_visitors(visitors)
    visitor_visit_counts = visitors.group_by { |e| e }.transform_values(&:length)
    visitor_visit_counts.select { |_, v| v > 1 }
  end
end
