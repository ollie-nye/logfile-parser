# frozen_string_literal: true

require 'visit'

describe Visit do
  describe 'initialize' do
    let(:visit) { described_class.new(log_line) }

    context 'when providing a properly structured log line' do
      let(:log_line) { "#{route} #{visitor}" }
      let(:route) { '/test-route' }

      context 'when the visitor is an IP address' do
        let(:visitor) { '001.002.003.004' }

        it 'does not raise an exception' do
          expect { described_class.new(log_line) }.not_to raise_error
        end

        it 'provides the route on the route method' do
          expect(visit.route).to eq(route)
        end

        it 'provides the visitor on the visitor method' do
          expect(visit.visitor).to eq(visitor)
        end
      end

      context 'when the visitor is not an IP address' do
        let(:visitor) { 'example.com' }

        it 'raises an exception for IP address' do
          expect { described_class.new(log_line) }.to raise_error(/Malformed IP address/)
        end
      end
    end

    context 'when providing a badly structured log line' do
      describe 'with only a route' do
        let(:log_line) { '/test-route' }

        it 'raises an exception for log line' do
          expect { described_class.new(log_line) }.to raise_error(/Malformed log line/)
        end
      end

      describe 'with a space in the route' do
        let(:log_line) { '/test route' }

        it 'raises an exception for IP address' do
          expect { described_class.new(log_line) }.to raise_error(/Malformed IP address/)
        end
      end

      describe 'with extra data after the visitor' do
        let(:log_line) { '/test-route 001.002.003.004 data' }

        it 'raises an exception for log line' do
          expect { described_class.new(log_line) }.to raise_error(/Malformed log line/)
        end
      end
    end
  end
end
