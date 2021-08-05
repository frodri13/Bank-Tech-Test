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

		expect(subject.transactions.first[0]).to be(deposit)
		expect(subject.balance).to eq(1000)
	end

	it 'can take a withdraw and change the balance of the account' do
		withdraw = instance_double(Transaction, deposit: false, ammount: 500)
		
		subject.transaction(withdraw)

		expect(subject.transactions.first[0]).to be(withdraw)
		expect(subject.balance).to eq(-500)
	end

	it 'can print a statement with one deposit' do
		account = Account.new
		deposit = Transaction.new(true, 1000)
		account.transaction(deposit)
		
		expect(account.print_statement).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n")
	end

	it 'can print a statement with two deposits' do
		account = Account.new
		deposit_1 = Transaction.new(true, 1000)
		deposit_2 = Transaction.new(true, 500)
		account.transaction(deposit_1)
		account.transaction(deposit_2)
		
		expect(account.print_statement).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n#{current_date} || 500.00 || || 1500.00\n")
	end

	it 'can print a statement with two deposits and a withdraw' do
		account = Account.new
		deposit_1 = Transaction.new(true, 1000)
		deposit_2 = Transaction.new(true, 2000)
		withdraw = Transaction.new(false, 500)
		account.transaction(deposit_1)
		account.transaction(deposit_2)
		account.transaction(withdraw)

		expect(account.print_statement).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n#{current_date} || 2000.00 || || 3000.00\n#{current_date} || || 500.00 || 2500.00\n")
	end
end