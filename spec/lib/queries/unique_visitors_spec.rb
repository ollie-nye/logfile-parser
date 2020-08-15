# frozen_string_literal: true

require 'queries/unique_visitors'
require 'for_queries'

describe UniqueVisitors do
  include_context 'for queries'

  let(:expected_output) do
    "1 unique visitors for /about/2\n" \
    "1 unique visitors for /contact\n" \
    "3 unique visitors for /help_page/1\n" \
    "1 unique visitors for /help_page/2\n" \
    "2 unique visitors for /home\n" \
    "1 unique visitors for /index\n"
  end

  describe 'self.query' do
    let(:expected_count) { 0 }

    it 'returns the expected output' do
      expect(result).to eq expected_output
    end
  end
end
