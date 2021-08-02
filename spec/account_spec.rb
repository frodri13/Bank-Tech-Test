require "account"

RSpec.describe Account do

	it 'can take a deposit and print back a bank statement'do
		subject.deposit("10/01/2012", 1000)
		expect(subject.print_bank_st).to eq("10/01/2012 || 1000.00 || || 1000.00")
	end
end