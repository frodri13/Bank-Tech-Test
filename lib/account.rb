class Account

	def initialize
		@balance = 0
		@transactions = ["date || credit || debit || balance "]
	end

	def deposit(date, ammount)
		@transactions << "#{date} || #{ammount}.00 || || #{@balance += ammount}.00"
	end

	def print_bank_st
	  @transactions.each {|line|
			puts line
		}
	end
end