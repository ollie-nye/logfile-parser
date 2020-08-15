# frozen_string_literal: true

# Returns the number of unique visitors for all routes
class UniqueVisitors
  def self.query(visits, _)
    output = ''
    visits.by_route.sort.each do |route, visitors|
      output += "#{visitors.uniq.count} unique visitors for #{route}\n"
    end
    output
  end
end
