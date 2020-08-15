# frozen_string_literal: true

require 'queries/visits_per_visitor'

describe VisitsPerVisitor do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { Visits.new }
  let(:result) { described_class.query(visits, nil) }
  let(:expected_output) do
    "126.318.035.038: 1 visits, 1 unique routes\n" \
    "722.247.931.582: 1 visits, 1 unique routes\n" \
    "646.865.545.408: 2 visits, 1 unique routes\n" \
    "929.398.951.889: 1 visits, 1 unique routes\n" \
    "184.123.665.067: 2 visits, 2 unique routes\n" \
    "235.313.352.950: 1 visits, 1 unique routes\n" \
    "444.701.448.104: 2 visits, 2 unique routes\n"
  end

  before do
    visits.parse(filename)
  end

  describe 'self.query' do
    it 'returns the expected output' do
      expect(result).to eq expected_output
    end
  end
end
