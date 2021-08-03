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

	it 'can take transactions with decimals'do
		subject.deposit("10-01-2012", 1000.45)
		subject.withdraw("14-01-2012", 500.05)

		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n14/01/2012 || || 500.05 || 500.40\n10/01/2012 || 1000.45 || || 1000.45")
	end

	it 'will ask the user to insert the date in the correct format'do
		expect { subject.deposit("01-14-2012", 500) }.to raise_error("Please format your date into DD/MM/YYYY")
	end

	it 'can take a date in a different format'do
		subject.deposit("10/01/2012", 1000)
		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
end

	it 'can show the current date when no date is inserted'do
		subject.deposit(1000)
		output = capture_stdout { subject.print_bank_st }
		expect(output.chomp).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00")
	end
end