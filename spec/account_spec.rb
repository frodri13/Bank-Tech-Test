require "account"

RSpec.describe Account do
  it 'can take a deposit and print back a bank statement'do
		subject.deposit("10/01/2012", 1000)
		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
	end

	it 'can take two deposits and print back a bank statement showing all transactions'do
		subject.deposit("10/01/2012", 1000)
		subject.deposit("13/01/2012", 2000)
		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq(
			"date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
		)
	end
end