require_relative 'transaction'

class Statement
	def initialize(transactions)
		@transactions = transactions
		@result = "date || credit || debit || balance\n"
	end

	def print
		formatting
	  @result
	end

	def formatting
		@transactions.each {|transaction|
			@result += "#{transaction[0].record} #{'%.2f' % transaction[1]}\n"
		}
	end
end