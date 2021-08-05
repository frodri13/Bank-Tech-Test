require 'statement'
require 'transaction'

RSpec.describe Statement do
	let(:deposit_1) { instance_double(Transaction, record: "#{current_date} || 1000.00 || ||", deposit: true, ammount: 1000)}
	let(:deposit_2) { instance_double(Transaction, record: "#{current_date} || 2000.00 || ||", deposit: true, ammount: 2000)}

	it 'can print a stament of a deposit'do
		balance_1 = 1000

		statement = Statement.new([[deposit_1, balance_1]])
		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n")
	end
	
	it 'can print a stament of multiple deposits'do
		balance_1 = 1000
		balance_2 = 3000

		statement = Statement.new([[deposit_1, balance_1], [deposit_2, balance_2]])
		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n#{current_date} || 2000.00 || || 3000.00\n")
	end
end