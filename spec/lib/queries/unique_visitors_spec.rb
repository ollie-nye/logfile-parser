# frozen_string_literal: true

require 'queries/unique_visitors'

describe UniqueVisitors do
  include_context 'for queries'

  let(:expected_output) do
    [
      '  1 unique visitors for /about/2',
      '  1 unique visitors for /contact',
      '  3 unique visitors for /help_page/1',
      '  1 unique visitors for /help_page/2',
      '  2 unique visitors for /home',
      '  1 unique visitors for /index'
    ]
  end

  describe 'self.query' do
    it_should_behave_like 'a correct query result'
  end
end
