require 'statement'
require 'account'

RSpec.describe Statement do
	it 'can print a statement with one deposit' do
		deposit = Transaction.new(true, 1000)
		balance = '%.2f' % 1000
		transactions = [deposit, balance]
		statement = Statement.new(transactions)

		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00")
	end

	it 'can print a statement with one deposit' do
		deposit = Transaction.new(true, 1000)
		deposit_1 = Transaction.new(true, 500)
		balance = '%.2f' % 1000
		balance_1 = '%.2f' % 1500

		transactions = [{transaction: deposit, balance: balance}, {transaction: deposit_1, balance: balance_1} ]
		statement = Statement.new(transactions)

		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n#{current_date} || 500.00 || || 1500.00")
	end
end