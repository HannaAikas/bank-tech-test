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
        line_items << line_item(key, value)
      end
    end
    puts statement_template
    line_items.each { |item| puts item }
  end

  private

  def statement_template
    'date || credit || debit || balance'
  end

  def line_item(key, value)
    if value[0] == :deposit
      "#{key} || #{format('%.2f', value[1])} || || #{format('%.2f', value[2])}"
    else
      "#{key} || || #{format('%.2f', value[1])} || #{format('%.2f', value[2])}"
    end
  end
end
