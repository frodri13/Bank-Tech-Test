require "account"

RSpec.describe Account do
  it 'can take a deposit and print back a bank statement'do
		subject.deposit("10-01-2012", 1000)
		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
	end

	it 'can take two deposits and print back a bank statement showing all transactions from newest to oldest'do
		subject.deposit("10-01-2012", 1000)
		subject.deposit("13-01-2012", 2000)

		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq(
			"date || credit || debit || balance\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00"
		)
	end

	it 'can withdraw from the total balance and print the current balance in negative'do
		subject.withdraw("14-01-2012", 500)

		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || -500.00")
	end

	it 'can show the total balance, and all types of transactions made from newest to oldest'do
		subject.deposit("10-01-2012", 1000)
		subject.deposit("13-01-2012", 2000)
		subject.withdraw("14-01-2012", 500)

		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || 2500.00\n13/01/2012 || 2000.00 || || 3000.00\n10/01/2012 || 1000.00 || || 1000.00")
	end
end