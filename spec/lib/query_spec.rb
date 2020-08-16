# frozen_string_literal: true

require 'query'
require 'visits'

describe Query do
  describe 'query' do
    let(:visits) { instance_double(Visits) }
    let(:argument) { 'some argument' }
    let(:logger) { instance_double(Logger) }

    before do
      allow(logger).to receive(:warn)
    end

    it 'warns about calling the base class directly' do
      described_class.query(visits, argument, logger: logger)
      expect(logger).to have_received(:warn).with('This method cannot be called outside of a query.')
    end
  end
end
