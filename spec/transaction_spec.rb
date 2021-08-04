require 'transaction'

RSpec.describe Transaction do
	it 'can make deposits' do
		subject.deposit(1000)

		expect(subject.ammount).to eq(1000)
	end

	it 'can make witdraws' do
		subject.withdraw(500)
		expect(subject.ammount).to eq(-500)
	end

end