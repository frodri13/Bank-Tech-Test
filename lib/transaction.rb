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
end