require 'client'

describe Client do
  context 'new client' do
    before(:each) do
      @client_a = Client.new
    end

    it 'is able to deposit money' do
      expect do
        @client_a.deposit_money(100, '20/09/2019')
      end.to change { @client_a.see_balance }.by(100)
    end

    it 'is able to withdraw money' do
      expect do
        @client_a.withdraw_money(30, '24/09/2019')
      end.to change { @client_a.see_balance }.by(-30)
    end

    it 'is able to print a statement' do
      @client_a.deposit_money(100, '20/09/2019')
      @client_a.withdraw_money(30, '24/09/2019')
      test_statement = "date || credit || debit || balance\n24/09/2019 || || 30.00 || 70.00\n20/09/2019 || 100.00 || || 100.00\n"
      expect do
        @client_a.print_statement
      end.to output(test_statement).to_stdout
    end
  end
end
