require 'statement'

describe Statement do
  before(:each) do
    @test_statement = Statement.new
    @test_statement.add_statement_item(:deposit, 100, '20/09/2019', 100)
  end

  it 'generates a statement' do
    expected_statement = "date || credit || debit || balance\n"\
    "20/09/2019 || 100.00 || || 100.00\n"
    expect do
      @test_statement.create_statement
    end.to output(expected_statement).to_stdout
  end
end
