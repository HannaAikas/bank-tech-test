require_relative './transaction.rb'
require_relative './statement.rb'

class Client
  def initialize(transaction = Transaction.new, statement = Statement.new)
    @transaction = transaction
    @statement = statement
  end

  def see_balance
    @transaction.check_balance
  end

  def deposit_money(amount, date)
    @transaction.do_deposit(amount, date)
    new_balance = @transaction.check_balance
    @statement.add_statement_item(:deposit, amount, date, new_balance)
  end

  def withdraw_money(amount, date)
    @transaction.do_withdrawal(amount, date)
    new_balance = @transaction.check_balance
    @statement.add_statement_item(:withdrawal, amount, date, new_balance)
  end

  def see_statement_items
    @statement.check_statement_items
  end

  def print_statement
    @statement.create_statement
  end
end
