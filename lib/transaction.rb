class Transaction
	attr_reader :deposit, :ammount, :date

	def initialize(deposit, ammount)
		@deposit = deposit
		@ammount = ammount
		@date = date
	end

	def date
		date = Time.new
		"#{date.day}/#{date.month}/#{date.year}"
	end

	def record
		@deposit ? "#{@date} || #{'%.2f' % @ammount} || ||" : "#{@date} || || #{'%.2f' % @ammount} ||" 
	end
end
