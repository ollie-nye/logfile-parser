# frozen_string_literal: true

require 'query'

# Returns the total number of page visits per visitor
class VisitsPerVisitor < Query
  def query
    visits.by_visitor.each do |visitor, routes|
      logger.info "  #{visitor}: #{routes.count} visits, #{routes.uniq.count} unique routes"
    end
  end
end
