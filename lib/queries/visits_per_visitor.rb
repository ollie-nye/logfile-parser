# frozen_string_literal: true

# Returns the total number of page visits per visitor
class VisitsPerVisitor
  def self.query(visits, _)
    output = ''
    visits.by_visitor.map do |visitor, routes|
      output += "#{visitor}: #{routes.count} visits, #{routes.uniq.count} unique routes\n"
    end
    output
  end
end
