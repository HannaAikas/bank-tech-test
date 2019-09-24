require 'statement'

describe Statement do
  before(:each) do
    @test_statement = Statement.new
    @test_statement.add_statement_item(:deposit, 100, '20/09/2019', 100)
  end
  it 'stores a record of transactions' do
    expected_result = [{ '20/09/2019' => [:deposit, 100, 100] }]
    expect(@test_statement.statement_items). to eq expected_result
  end
end
