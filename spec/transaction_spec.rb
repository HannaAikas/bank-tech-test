require 'transaction'

describe Transaction do
  before(:each) do
    @transaction = Transaction.new
  end
  it 'returns error if balance insufficient' do
    expect do
      @transaction.do_withdrawal(1000, '24/09/2019')
    end.to raise_error('Insufficient funds')
  end
end
