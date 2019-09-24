require_relative './transaction.rb'

class Client
  def initialize(transaction = Transaction.new)
    @transaction = transaction
  end

  def see_balance
    @transaction.check_balance
  end

  def deposit_money(amount, date)
    @transaction.do_deposit(amount, date)
  end
end
