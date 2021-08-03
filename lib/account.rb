class Account
	def initialize
		@balance = 0
		@result = ["date || credit || debit || balance"]
		@transactions = []
	end

	def deposit(date, ammount)
		@transactions << "#{format(date)} || #{decimal_formatter(ammount)} || || #{decimal_formatter(@balance += ammount)}"
	end

	def withdraw(date, ammount)
		@transactions << "#{format(date)} || || #{decimal_formatter(ammount)} || #{decimal_formatter(@balance -= ammount)}"
	end

	def print_bank_st 
		@result << order
	  @result.each {|line|
			puts line
		}
	end

	private

	def decimal_formatter(ammount)
		'%.2f' % ammount
	end

	def format(date)
		fail "Please format your date into DD/MM/YYYY" if date[3, 2].to_i > 12 
		date.include?("-") ? date.gsub!("-", "/") : date
	end

	def order
		@transactions.sort_by(&:itself).reverse
	end
end
