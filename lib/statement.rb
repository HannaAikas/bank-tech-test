class Statement
  def initialize
    @statement_items = []
  end

  def add_statement_item(type, amount, date, new_balance)
    new_item = { date => [type, amount, new_balance] }
    @statement_items.unshift(new_item)
  end

  def check_statement_items
    @statement_items
  end

  def create_statement
    line_items = []
    @statement_items.each do |item|
      item.each do |key, value|
        line_items << if value[0] == :deposit
                        "#{key} || #{'%.2f' % value[1]} || || #{'%.2f' % value[2]}"
                      else
                        "#{key} || || #{'%.2f' % value[1]} || #{'%.2f' % value[2]}"
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
end
