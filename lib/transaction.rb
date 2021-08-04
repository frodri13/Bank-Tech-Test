class Transaction
	attr_reader :ammount

	def initialize
		@ammount = 0
	end

	def deposit(credit)
		@ammount = credit
	end
end