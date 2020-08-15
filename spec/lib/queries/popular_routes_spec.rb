# frozen_string_literal: true

require 'queries/popular_routes'

describe PopularRoutes do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { Visits.new }
  let(:result) { described_class.query(visits, nil) }
  let(:expected_output) do
    "/help_page/1: 4 visits, 3 unique visitors\n" \
    "/home: 2 visits, 2 unique visitors\n" \
    "/about/2: 1 visits, 1 unique visitors\n" \
    "/contact: 1 visits, 1 unique visitors\n" \
    "/help_page/2: 1 visits, 1 unique visitors\n" \
    "/index: 1 visits, 1 unique visitors\n"
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
