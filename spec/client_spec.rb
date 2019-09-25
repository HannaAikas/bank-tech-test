require 'client'

describe Client do
  let(:transaction) { double('transaction') }
  let(:statement) { double('statement') }

  before(:each) do
    @client_a = Client.new(transaction, statement)
  end

  it 'deposits money' do
    allow(transaction).to receive(:do_deposit) { 100 }
    allow(transaction).to receive(:check_balance) { 100 }
    allow(statement).to receive(:add_statement_item) do
      { '20/09/2019' => [:deposit, 100, 100] }
    end

    action = @client_a.deposit_money(100, '20/09/2019')
    expect(action).to eq('20/09/2019' => [:deposit, 100, 100])
  end

  it 'withdraws money' do
    allow(transaction).to receive(:do_withdrawal) { 70 }
    allow(transaction).to receive(:check_balance) { 70 }
    allow(statement).to receive(:add_statement_item) do
      { '24/09/2019' => [:withdrawal, 30, 70] }
    end

    action = @client_a.withdraw_money(30, '24/09/2019')
    expected_output = { '24/09/2019' => [:withdrawal, 30, 70] }
    expect(action).to eq expected_output
  end

  it 'prints a statement' do
    allow(transaction).to receive(:do_deposit) { 100 }
    allow(transaction).to receive(:check_balance) { 100 }
    allow(statement).to receive(:add_statement_item) do
      { '20/09/2019' => [:deposit, 100, 100] }
    end
    allow(statement).to receive(:create_statement) do
      ['20/09/2019 || 100.00 || || 100.00']
    end

    @client_a.deposit_money(100, '20/09/2019')
    expected_output = ['20/09/2019 || 100.00 || || 100.00']
    expect(@client_a.print_statement).to eq expected_output
  end
end
