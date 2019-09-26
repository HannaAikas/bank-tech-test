require 'transaction'

describe Transaction do
  before(:each) do
    @transaction = Transaction.new
    @transaction.do_deposit(100, '20/09/2019')
  end

  describe '#do_deposit' do
    it 'doing a deposit returns the revised balance' do
      test_transaction = @transaction.do_deposit(100, '20/09/2019')
      expect(test_transaction).to eq 200
    end
    it 'returns error if date invalid' do
      expect do
        @transaction.do_deposit(10, '60/09/2019')
      end.to raise_error('Incorrect date')
    end
  end

  describe '#do_withdrawal' do
    it 'doing a withdrawal returns the revised balance' do
      test_transaction = @transaction.do_withdrawal(30, '24/09/2019')
      expect(test_transaction).to eq 70
    end
    it 'returns error if balance insufficient' do
      expect do
        @transaction.do_withdrawal(1000, '24/09/2019')
      end.to raise_error('Insufficient funds')
    end
    it 'returns error if date invalid' do
      expect do
        @transaction.do_withdrawal(10, '24/20/2019')
      end.to raise_error('Incorrect date')
    end
  end
end
