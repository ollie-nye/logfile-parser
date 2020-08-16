# frozen_string_literal: true

require 'visits'

shared_context 'for queries' do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:logger) { instance_double(Logger) }
  let(:visits) { Visits.new }
  let(:query_arg) { true }

  before do
    allow(logger).to receive :info
    visits.parse(filename)
    described_class.query(visits, query_arg, logger: logger)
  end
end
