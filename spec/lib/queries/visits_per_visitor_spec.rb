# frozen_string_literal: true

require 'queries/visits_per_visitor'

describe VisitsPerVisitor do
  include_context 'for queries'

  let(:expected_output) do
    [
      '  126.318.035.038: 1 visits, 1 unique routes',
      '  722.247.931.582: 1 visits, 1 unique routes',
      '  646.865.545.408: 2 visits, 1 unique routes',
      '  929.398.951.889: 1 visits, 1 unique routes',
      '  184.123.665.067: 2 visits, 2 unique routes',
      '  235.313.352.950: 1 visits, 1 unique routes',
      '  444.701.448.104: 2 visits, 2 unique routes'
    ]
  end

  describe 'self.query' do
    it_should_behave_like 'a correct query result'
  end
end
