require 'client'
describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'creates a new client' do
    expect(@client_a).to be_a_kind_of(Client)
  end
  it 'checks the bank balance' do
    expect(@client_a.check_balance).to be 0
  end
  it 'deposits money' do
    @client_a.deposit(100, 20-9-2019)
    expect(@client_a.check_balance).to be 100
  end
end
