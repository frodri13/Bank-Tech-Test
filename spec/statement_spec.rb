require 'statement'
require 'transaction'

RSpec.describe Statement do
	let(:deposit_1) { instance_double(Transaction, record: "#{current_date} || 1000.00 || ||", deposit: true, ammount: 1000)}
	let(:deposit_2) { instance_double(Transaction, record: "#{current_date} || 2000.00 || ||", deposit: true, ammount: 2000)}
	let(:withdraw) {instance_double(Transaction, record: "#{current_date} || || 500.00 ||", deposit: false, ammount: 500)}

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

	it 'can print a statement with only one withdraw' do
		negative_balance = -500
		statement = Statement.new([[withdraw, negative_balance]])

		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || || 500.00 || -500.00\n")
	end

	it 'can print a statement with multiple withdraws' do
		negative_balance_1 = -500
		negative_balance_2 = -1000
		statement = Statement.new([[withdraw, negative_balance_1], [withdraw, negative_balance_2]])

		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || || 500.00 || -500.00\n#{current_date} || || 500.00 || -1000.00\n")
	end

	it 'can print a stament of multiple deposits and one withdraw'do
		balance_1 = 1000
		balance_2 = 3000
		balance_3 = 2500
 
		statement = Statement.new([[deposit_1, balance_1], [deposit_2, balance_2], [withdraw, balance_3]])
		expect(statement.print).to eq("date || credit || debit || balance\n#{current_date} || 1000.00 || || 1000.00\n#{current_date} || 2000.00 || || 3000.00\n#{current_date} || || 500.00 || 2500.00\n")
	end
end