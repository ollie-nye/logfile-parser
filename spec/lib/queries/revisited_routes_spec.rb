# frozen_string_literal: true

require 'queries/revisited_routes'
require 'for_queries'

describe RevisitedRoutes do
  include_context 'for queries'

  let(:expected_output) do
    "/help_page/1: 1 revisitors, 1 revisits\n"
  end

  describe 'self.query' do
    it 'returns the expected output' do
      expect(result).to eq expected_output
    end
  end
end
