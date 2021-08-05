require_relative 'transaction' 
require_relative 'statement'

class Account
	attr_reader :transactions, :balance
	def initialize
		@balance = 0
		@transactions = []
	end

	def add_transaction(transaction = @auto)
		add_to_balance(transaction)
		@transactions << [transaction, @balance]
	end

	def add_to_balance(transaction)
		transaction.deposit ? @balance += transaction.ammount : @balance -= transaction.ammount 
	end

	def transaction(deposit, ammount)
		@auto = Transaction.new(deposit, ammount)
		add_transaction
	end

	def print_statement
		Statement.new(@transactions).print
	end
end
