class Account
	def initialize
		@balance = 0
		@transactions = []
	end

	def deposit(date, ammount)
		@date = date
		@ammount = ammount
		@balance += @ammount
	end

	def print_bank_st
		 "#{@date} || #{@ammount}.00 || || #{@balance}.00"
	end
end