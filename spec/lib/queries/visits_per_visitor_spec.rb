# frozen_string_literal: true

require 'queries/visits_per_visitor'
require 'for_queries'

describe VisitsPerVisitor do
  include_context 'for queries'

  let(:expected_output) do
    "126.318.035.038: 1 visits, 1 unique routes\n" \
    "722.247.931.582: 1 visits, 1 unique routes\n" \
    "646.865.545.408: 2 visits, 1 unique routes\n" \
    "929.398.951.889: 1 visits, 1 unique routes\n" \
    "184.123.665.067: 2 visits, 2 unique routes\n" \
    "235.313.352.950: 1 visits, 1 unique routes\n" \
    "444.701.448.104: 2 visits, 2 unique routes\n"
  end

  describe 'self.query' do
    it 'returns the expected output' do
      expect(result).to eq expected_output
    end
  end
end
