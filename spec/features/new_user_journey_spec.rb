require 'client'

describe Client do
  context 'new client' do
    before(:each) do
      @client_a = Client.new
    end

    it 'is able to deposit money' do
      expect do
        @client_a.deposit_money(100, 20-9-2019)
      end.to change { @client_a.see_balance }.by(100)
    end

    it 'is able to withdraw money' do
      expect do
        @client_a.withdraw_money(30, 24-9-2019)
      end.to change { @client_a.see_balance }.by(-30)
    end
  end
end
