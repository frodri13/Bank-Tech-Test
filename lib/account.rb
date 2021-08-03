class Account
	def initialize
		@balance = 0
		@result = ["date || credit || debit || balance"]
		@transactions = []
	end

	def deposit(date, ammount)
		@transactions << "#{format(date)} || #{ammount}.00 || || #{@balance += ammount}.00"
	end

	def withdraw(date, ammount)
		@transactions << "#{format(date)} || || #{ammount}.00 || #{@balance -= ammount}.00"
	end

	def format(date)
		date.gsub! "-", "/"
	end

	def order
		@transactions.sort_by(&:itself).reverse
	end

	def print_bank_st 
		@result << order
	  @result.each {|line|
			puts line
		}
	end
end
