require "account"

RSpec.describe Account do
	let(:deposit) {instance_double(Transaction, record: "#{current_date} || 1000.00 || ||", deposit: true, ammount: 1000)}
	let(:deposit_1) {instance_double(Transaction, record: "10/01/2012 || 1000.00 || ||", deposit: true, ammount: 1000)}
	let(:deposit_2) {instance_double(Transaction, record: "13/01/2012 || 2000.00 || ||", deposit: true, ammount: 2000)}
	let(:withdraw) {instance_double(Transaction, record: "14/01/2012 || || 500.00 ||", deposit: false, ammount: 500)}

	it 'can print a statement with one deposit' do
		subject.add_transaction(deposit_1)
		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n")
	end

	it 'can print a statement with two deposits' do
		subject.add_transaction(deposit_1)
		subject.add_transaction(deposit_2)
		
		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n")
	end

	it 'can print a statement with two deposits and a withdraw' do
		subject.add_transaction(deposit_1)
		subject.add_transaction(deposit_2)
		subject.add_transaction(withdraw)

		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n14/01/2012 || || 500.00 || 2500.00\n")
	end

	it 'can print out a negative balance' do
		subject.add_transaction(withdraw)

		expect(subject.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || -500.00\n")
	end

	it 'can add up multiple withdrawals' do
		subject.add_transaction(withdraw)
		subject.add_transaction(withdraw)

		expect(subject.print_statement).to eq("date || credit || debit || balance\n14/01/2012 || || 500.00 || -500.00\n14/01/2012 || || 500.00 || -1000.00\n")
	end

	it 'can keep track of the date of the transaction'do
		subject.add_transaction(deposit)
		expect(subject.print_statement).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n")
	end

	it 'prints the same output when asked multiple times'do
		subject.add_transaction(deposit_1)
		subject.add_transaction(deposit_2)
		subject.add_transaction(withdraw)

		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n14/01/2012 || || 500.00 || 2500.00\n")
		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n14/01/2012 || || 500.00 || 2500.00\n")
		expect(subject.print_statement).to eq("date || credit || debit || balance\n10/01/2012 || 1000.00 || || 1000.00\n13/01/2012 || 2000.00 || || 3000.00\n14/01/2012 || || 500.00 || 2500.00\n")
	end
end