class Transaction
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end

  def do_deposit(amount, _date)
    @balance += amount
  end

  def do_withdrawal(amount, _date)
    @balance -= amount
  end
end
