# frozen_string_literal: true

shared_examples 'a correct query result' do
  it 'produces the expected output' do
    expected_output.each do |line|
      expect(logger).to have_received(:info).with(line).ordered
    end
  end
end
