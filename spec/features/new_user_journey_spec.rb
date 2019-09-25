require 'client'

describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'is able to deposit, withdraw and print a statement' do
    @client_a.deposit_money(100, '20/09/2019')
    @client_a.withdraw_money(30, '24/09/2019')
    expected_statement = "date || credit || debit || balance\n"\
    "24/09/2019 || || 30.00 || 70.00\n"\
    "20/09/2019 || 100.00 || || 100.00\n"
    expect do
      @client_a.print_statement
    end.to output(expected_statement).to_stdout
  end
end
