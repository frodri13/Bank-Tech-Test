class Transaction
	attr_reader :ammount

	def initialize
		@ammount = 0
	end

	def deposit(credit)
		@ammount = credit
	end

	def withdraw(debit)
		@ammount = -debit
	end

	def date
		date = Time.new
		"#{date.day}/#{date.month}/#{date.year}"
	end
end