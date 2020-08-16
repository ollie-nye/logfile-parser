# frozen_string_literal: true

require 'queries/unique_visitors_for'

describe UniqueVisitorsFor do
  include_context 'for queries'
  let(:expected_output) { ["#{expected_count} unique visitors for #{query_arg}"] }

  describe 'self.query' do
    context 'when the route exists' do
      let(:query_arg) { '/help_page/1' }
      let(:expected_count) { 3 }

      it_should_behave_like 'a correct query result'
    end

    context 'when the route does not exist' do
      let(:query_arg) { '/does-not-exist' }
      let(:expected_count) { 0 }

      it 'does not raise an error' do
        expect { described_class.query(visits, query_arg, logger: logger) }.not_to raise_error
      end

      it_should_behave_like 'a correct query result'
    end
  end
end
