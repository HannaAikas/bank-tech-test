require 'client'

describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'is able to deposit money' do
    @client_a.deposit_money(100, '20/09/2019')
    @client_a.deposit_money(50, '21/09/2019')
    expect(@client_a.see_balance).to eq 150
  end

  it 'is able to withdraw money' do
    @client_a.deposit_money(100, '20/09/2019')
    @client_a.withdraw_money(30, '24/09/2019')
    expect(@client_a.see_balance).to eq 70
  end

  it 'is able to print a statement' do
    @client_a.deposit_money(100, '20/09/2019')
    @client_a.withdraw_money(30, '24/09/2019')
    test_statement = "date || credit || debit || balance\n"\
    "24/09/2019 || || 30.00 || 70.00\n"\
    "20/09/2019 || 100.00 || || 100.00\n"
    expect do
      @client_a.print_statement
    end.to output(test_statement).to_stdout
  end
end
