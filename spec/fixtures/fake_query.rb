# frozen_string_literal: true

require 'query'

# Fake query class used for tests
class FakeQuery < Query
  def query
    logger.info 'FakeQuery result'
  end
end
