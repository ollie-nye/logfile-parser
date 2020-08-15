# frozen_string_literal: true

require 'queries/history_for'
require 'for_queries'

describe HistoryFor do
  include_context 'for queries'

  describe 'self.query' do
    context 'when the visitor exists' do
      let(:query_arg) { '184.123.665.067' }
      let(:expected_output) do
        " - /contact\n" \
        " - /home\n"
      end

      it 'returns the full history for 184.123.665.067' do
        expect(result).to eq expected_output
      end
    end

    context 'when the visitor does not exist' do
      let(:query_arg) { '001.002.003.004' }
      let(:expected_output) { '' }

      it 'does not raise an error' do
        expect { described_class.query(visits, query_arg) }.not_to raise_error
      end

      it 'returns no history' do
        expect(result).to eq expected_output
      end
    end
  end
end
