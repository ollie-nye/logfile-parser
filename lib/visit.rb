# frozen_string_literal: true

# Provides validation and storage for a particular visit from the logs
class Visit
  attr_reader :route, :visitor

  def initialize(log_line)
    visit = log_line.split(' ')
    raise "Malformed log line: #{log_line}" unless visit.length == 2

    @route, visitor = visit
    @visitor = visitor if valid_ip_address?(visitor)
  end

  private

  # Validates a given visitor against the dotted IPv4 structure, raising an
  # exception if it does not conform
  def valid_ip_address?(visitor)
    parts = visitor.split('.')
    raise "Malformed IP address: #{visitor}" unless parts.length == 4

    true
  end
end
