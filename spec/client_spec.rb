require 'client'

describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'deposits money' do
    action = @client_a.deposit_money(100, '20/09/2019')
    expect(action).to eq [{ '20/09/2019' => [:deposit, 100, 100] }]
  end
  it 'withdraws money' do
    @client_a.deposit_money(100, '20/09/2019')
    action = @client_a.withdraw_money(30, '24/09/2019')
    first_transaction = { '24/09/2019' => [:withdrawal, 30, 70] }
    second_transaction = { '20/09/2019' => [:deposit, 100, 100] }
    expected_output = [first_transaction, second_transaction]
    expect(action).to eq expected_output
  end
  it 'prints a statement' do
    @client_a.deposit_money(100, '20/09/2019')
    expected_statement = "date || credit || debit || balance\n"\
    "20/09/2019 || 100.00 || || 100.00\n"
    expect do
      @client_a.print_statement
    end.to output(expected_statement).to_stdout
  end
end
