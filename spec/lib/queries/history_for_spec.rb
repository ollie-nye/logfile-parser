# frozen_string_literal: true

require 'queries/history_for'

describe HistoryFor do
  include_context 'for queries'

  describe 'self.query' do
    context 'when the visitor exists' do
      let(:query_arg) { '184.123.665.067' }
      let(:expected_output) do
        [
          ' - /contact',
          ' - /home'
        ]
      end

      it_should_behave_like 'a correct query result'
    end

    context 'when the visitor does not exist' do
      let(:query_arg) { '001.002.003.004' }

      it 'does not raise an error' do
        expect { described_class.query(visits, query_arg) }.not_to raise_error
      end

      it 'returns no history' do
        expect(logger).not_to have_received(:info)
      end
    end
  end
end
