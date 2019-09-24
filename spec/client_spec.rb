require 'client'
describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'creates clients with a nil balance' do
    expect(@client_a.see_balance).to eq 0
  end
  it '#deposit_money increases the balance' do
    @client_a.deposit_money(100, 20-9-2019)
    expect(@client_a.see_balance).to eq 100
  end
  it '#withdraw_money decreases the balance' do
    @client_a.deposit_money(100, 20-9-2019)
    @client_a.withdraw_money(30, 24-9-2019)
    expect(@client_a.see_balance).to eq 70
  end
end
