require 'statement'
describe Statement do
  before(:each) do
    @client_a = Client.new
    @client_a.deposit_money(100, '20/09/2019')
  end

  it 'holds a record of all transactions' do
    expect(@client_a.see_statement_items).to eq [{ '20/09/2019' => [:deposit, 100, 100] }]
  end

  it '#create_statement makes an array of transactions' do
    test_array = ['20/09/2019 || 100.00 || || 100.00']
    expect(@client_a.print_statement).to eq test_array
  end
end
