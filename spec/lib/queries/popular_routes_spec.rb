# frozen_string_literal: true

require 'queries/popular_routes'

describe PopularRoutes do
  include_context 'for queries'

  let(:expected_output) do
    [
      '  /help_page/1: 4 visits, 3 unique visitors',
      '  /home: 2 visits, 2 unique visitors',
      '  /about/2: 1 visits, 1 unique visitors',
      '  /contact: 1 visits, 1 unique visitors',
      '  /help_page/2: 1 visits, 1 unique visitors',
      '  /index: 1 visits, 1 unique visitors'
    ]
  end

  describe 'self.query' do
    it_should_behave_like 'a correct query result'
  end
end
