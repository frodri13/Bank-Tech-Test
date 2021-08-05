require 'transaction'

RSpec.describe Transaction do
	it 'can make deposits and record the date of the transaction' do
		deposit = Transaction.new(true, 1000)
		expect(deposit.record).to eq("#{current_date} || 1000.00 || ||")
	end

	it 'can make withdraws and record the date of the transaction' do
		withdraw = Transaction.new(false, 500)
		expect(withdraw.record).to eq("#{current_date} || || 500.00 ||")
	end
end
