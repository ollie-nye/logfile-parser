# frozen_string_literal: true

require 'queries/unique_visitors_for'

describe UniqueVisitorsFor do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { Visits.new }
  let(:result) { described_class.query(visits, route) }
  let(:expected_output) { "#{expected_count} unique visitors for #{route}" }

  before do
    visits.parse(filename)
  end

  describe 'self.query' do
    context 'when the route exists' do
      let(:route) { '/help_page/1' }
      let(:expected_count) { 3 }

      it 'returns a count of 3 for /help_page/1' do
        expect(result).to eq expected_output
      end
    end

    context 'when the route does not exist' do
      let(:route) { '/does-not-exist' }
      let(:expected_count) { 0 }

      it 'does not raise an error' do
        expect { described_class.query(visits, route) }.not_to raise_error
      end

      it 'returns a count of 0' do
        expect(result).to eq expected_output
      end
    end
  end
end
