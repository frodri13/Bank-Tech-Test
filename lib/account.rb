class Account

	def deposit(date, ammount)
		@date = date
		@ammount = ammount
	end

	def print_bank_st
		 "#{@date} || #{@ammount}.00 || || #{@ammount}.00"
	end
end