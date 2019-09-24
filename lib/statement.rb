class Statement
  attr_reader :statement_items

  def initialize
    @statement_items = []
  end

  def add_statement_item(type, amount, date, new_balance)
    new_item = { date => [type, amount, new_balance] }
    @statement_items.unshift(new_item)
  end

  def create_statement
    line_items = []
    @statement_items.each do |item|
      item.each do |key, value|
        if value[0] == :deposit
          line_items << deposit_item(key, value)
        else
          line_items << withdrawal_item(key, value)
        end
      end
    end
    puts statement_template
    line_items.each { |item| puts item }
  end

  private

  def statement_template
    'date || credit || debit || balance'
  end

  def deposit_item(key, value)
    "#{key} || #{format('%.2f', value[1])} || || #{format('%.2f', value[2])}"
  end

  def withdrawal_item(key, value)
    "#{key} || || #{format('%.2f', value[1])} || #{format('%.2f', value[2])}"
  end
end
