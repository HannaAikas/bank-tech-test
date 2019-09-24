require 'client'

describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'creates clients with a nil balance' do
    expect(@client_a.see_balance).to eq 0
  end

  describe '#deposit_money' do
    it 'increases the balance' do
      expect do
        @client_a.deposit_money(100, '20/09/2019')
      end.to change { @client_a.see_balance }.by(100)
    end
  end

  describe '#withdraw_money' do
    it 'decreases the balance' do
      @client_a.deposit_money(100, '20/09/2019')
      expect do
        @client_a.withdraw_money(30, '24/09/2019')
      end.to change { @client_a.see_balance }.by(-30)
    end
  end
end
