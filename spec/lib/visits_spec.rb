# frozen_string_literal: true

require 'visits'

describe Visits do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { described_class.new }

  describe 'initialize' do
    it 'exposes visits and sets it to empty array' do
      expect(visits.visits).to eq([])
    end
  end

  describe 'parse' do
    before do
      visits.parse(filename)
    end

    it 'adds the 10 loglines to the visits attr' do
      expect(visits.visits.length).to be 10
    end
  end

  describe 'for_route' do
    before do
      visits.parse(filename)
    end

    let(:route) { :'/help_page/1' }

    it 'returns 4 visits for /help_page/1' do
      expect(visits.for_route(route).length).to eq 4
    end
  end

  describe 'by_route' do
    let(:expected_visitors) do
      %i[126.318.035.038 722.247.931.582 646.865.545.408 646.865.545.408]
    end
    let(:route) { :'/help_page/1' }

    before do
      visits.parse(filename)
    end

    it 'returns a hash' do
      expect(visits.by_route).to be_a Hash
    end

    it 'has a key of /help_page/1' do
      expect(visits.by_route.keys).to include route
    end

    it 'collects the visitors for /help_page/1' do
      expect(visits.by_route[route]).to eq expected_visitors
    end
  end

  describe 'for_visitor' do
    let(:visitor) { :'184.123.665.067' }

    before do
      visits.parse(filename)
    end

    it 'returns 2 visits for 184.123.665.067' do
      expect(visits.for_visitor(visitor).length).to eq 2
    end
  end

  describe 'by_visitor' do
    let(:expected_routes) { %i[/contact /home] }
    let(:visitor) { :'184.123.665.067' }

    before do
      visits.parse(filename)
    end

    it 'returns a hash' do
      expect(visits.by_visitor).to be_a Hash
    end

    it 'has a key of 184.123.665.067' do
      expect(visits.by_visitor.keys).to include visitor
    end

    it 'collects the routes for 184.123.665.067' do
      expect(visits.by_visitor[visitor]).to eq expected_routes
    end
  end
end
