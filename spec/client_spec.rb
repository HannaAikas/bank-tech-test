require 'client'
describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'creates clients with a nil balance' do
    expect(@client_a.check_balance).to eq 0
  end
  it 'deposits money' do
    @client_a.deposit(100, 20-9-2019)
    expect(@client_a.check_balance).to eq 100
  end
end
