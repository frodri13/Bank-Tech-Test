require "account"

RSpec.describe Account do
  # it 'can take a deposit and print back a bank statement'do
	# 	subject.deposit("10-01-2012", 1000)
	# 	output = capture_stdout { subject.print_bank_st }
	# 	expect(output.chomp).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00")
	# end
	# account = instance_double(Account, transactions: ["#{current_date} || 1000.00 || ||"], balance: 1000)
	it 'can take a deposit and change the balance of the account' do
		deposit = instance_double(Transaction, deposit: true, ammount: 1000)
		subject.transaction(deposit)

		expect(subject.transactions[0]).to be(deposit)
		expect(subject.balance).to eq(1000)
	end

	it 'can take a withdraw and change the balance of the account' do
		withdraw = instance_double(Transaction, deposit: false, ammount: 500)
		
		subject.transaction(withdraw)

		expect(subject.transactions[0]).to be(withdraw)
		expect(subject.balance).to eq(-500)
	end
end