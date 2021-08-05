require "account"

RSpec.describe Account do
  # it 'can take a deposit and print back a bank statement'do
	# 	subject.deposit("10-01-2012", 1000)
	# 	output = capture_stdout { subject.print_bank_st }
	# 	expect(output.chomp).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
	# end
	# account = instance_double(Account, transactions: ["#{current_date} || 1000.00 || ||"], balance: 1000)
	it 'can take a deposit' do
		transaction = Transaction.new(true, 1000)

		subject(transaction)

		expect(subject.transactions[0]).to eq(transaction)
	end

end