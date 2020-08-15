# frozen_string_literal: true

# Returns the history for a particular visitor, in the order it appeared in the log
class HistoryFor
  def self.query(visits, visitor)
    output = ''
    visits.by_visitor[visitor]&.each do |route|
      output += " - #{route}\n"
    end
    output
  end
end
