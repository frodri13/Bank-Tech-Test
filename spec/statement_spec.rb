require 'statement'
require 'account'

RSpec.describe Statement do
	# ["date || credit || debit || balance"]
	it 'can print a statement with one deposit' do
		deposit = Transaction.new(true, 1000)

		transactions = [deposit]
		statement = Statement.new(transactions)

		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || ||")
	end
end