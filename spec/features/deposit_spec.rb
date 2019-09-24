require 'client'

describe Client do
  context 'new client' do
    before(:each) do
      @client_a = Client.new
    end

    it 'deposits money' do
      expect(@client_a.check_balance).to be 0
      @client_a.deposit(100, 20-9-2019)
      expect(@client_a.check_balance).to be 100
    end
  end
end
