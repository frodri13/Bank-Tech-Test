class Transaction
	attr_reader :ammount
	
	def initialize
		@ammount = 0
	end

	def deposit(ammount)
		@ammount = ammount
	end
end