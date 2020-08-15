# frozen_string_literal: true

require 'queries/revisited_routes'

describe RevisitedRoutes do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { Visits.new }
  let(:result) { described_class.query(visits, nil) }
  let(:expected_output) do
    "/help_page/1: 1 revisitors, 1 revisits\n"
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
