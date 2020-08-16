# frozen_string_literal: true

require 'queries/revisited_routes'

describe RevisitedRoutes do
  include_context 'for queries'

  let(:expected_output) { ['  /help_page/1: 1 revisitors, 1 revisits'] }

  describe 'self.query' do
    it_should_behave_like 'a correct query result'
  end
end
