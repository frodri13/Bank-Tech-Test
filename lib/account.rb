require 'transaction'
require 'statement'

class Account
	attr_reader :transactions, :balance
	def initialize
		@balance = 0
		@transactions = []
	end

	def transaction(transaction)
		@transactions << transaction
		transaction.deposit ? @balance += transaction.ammount : @balance -= transaction.ammount 
	end

	def print_statement
		Statement.new(@transactions)
	end
end
