require 'transaction'

RSpec.describe Transaction do
	it 'can take deposits' do
		subject.deposit(1000)

		expect(subject.ammount).to eq(1000)
	end
end