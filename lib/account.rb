require_relative 'transaction' 
require_relative 'statement'

class Account
	attr_reader :transactions, :balance
	def initialize
		@balance = 0
		@transactions = []
	end

	def transaction(transaction)
		transaction.deposit ? @balance += transaction.ammount : @balance -= transaction.ammount 
		@transactions << [transaction, @balance]
	end

	def print_statement
		Statement.new(@transactions).print
	end
end
