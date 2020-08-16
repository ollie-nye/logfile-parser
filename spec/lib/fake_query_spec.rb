# frozen_string_literal: true

require 'fixtures/fake_query'
require 'visits'

describe FakeQuery do
  describe 'self.query' do
    let(:visits) { instance_double(Visits) }
    let(:argument) { 'some argument' }
    let(:instance) { described_class.query(visits, argument, logger: logger) }

    shared_examples 'instance setup' do
      it 'sets visits' do
        expect(instance.visits).to be visits
      end

      it 'sets argument' do
        expect(instance.argument).to be argument
      end
    end

    context 'with a logger provided' do
      let(:logger) { instance_double(Logger) }

      before do
        allow(logger).to receive(:info)
      end

      include_examples 'instance setup'

      it 'sets logger' do
        expect(instance.logger).to be logger
      end
    end

    context 'without a logger provided' do
      let(:logger) { nil }

      include_examples 'instance setup'

      it 'creates and sets a logger' do
        expect(instance.logger).to be_kind_of Logger
      end
    end
  end
end
