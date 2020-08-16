# frozen_string_literal: true

require 'query'

# Returns the history for a particular visitor, in the order it appeared in the log
class HistoryFor < Query
  def query
    visits.by_visitor[argument]&.each do |route|
      logger.info "   - #{route}"
    end
  end
end
