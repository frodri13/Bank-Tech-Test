class Account

	def initialize
		@balance = 0
		@result = ["date || credit || debit || balance"]
		@transactions = []
	end

	def deposit(date, ammount)
		@transactions << "#{date} || #{ammount}.00 || || #{@balance += ammount}.00"
	end

	def print_bank_st
		@result << @transactions.sort_by(&:itself).reverse
	  @result.each {|line|
			puts line
		}
	end
end
