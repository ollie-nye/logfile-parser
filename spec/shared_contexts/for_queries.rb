RSpec.shared_context 'for queries' do
  let(:filename) { 'spec/fixtures/webserver_test.log' }
  let(:visits) { Visits.new }
  let(:query_arg) { true }
  let(:result) { described_class.query(visits, query_arg) }

  before do
    visits.parse(filename)
  end
end
