require_relative 'transaction'

class Statement
	def initialize(transactions)
		@transactions = transactions
		@table = "date || credit || debit || balance\n"
	end

	def print
		"#{@table}#{@transactions[0].record} #{@transactions[1]}"
	end
end