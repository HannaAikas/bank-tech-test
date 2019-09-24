class Client
  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end

  def deposit(amount, date)
    @balance += amount
  end
end
