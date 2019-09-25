class Transaction
  def initialize
    @balance = 0
  end

  def check_balance
    @balance
  end

  def do_deposit(amount, date)
    raise 'Incorrect date' unless valid_date?(date)

    @balance += amount
  end

  def do_withdrawal(amount, date)
    raise 'Insufficient funds' unless @balance > amount
    raise 'Incorrect date' unless valid_date?(date)

    @balance -= amount
  end

  private

  def valid_date?(date)
    if check_day(date) && check_month(date) && check_year(date)
      true
    else
      false
    end
  end

  def check_day(date)
    date[0, 2].to_i.positive? && date[0, 2].to_i < 32
  end

  def check_month(date)
    date[3, 2].to_i.positive? && date[3, 2].to_i < 13
  end

  def check_year(date)
    date[6, 4].to_i > 2000 && date[6, 4].to_i < 3000
  end
end
