require 'client'

describe Client do
  before(:each) do
    @client_a = Client.new
  end

  it 'creates clients' do
    expect(@client_a).to be_a_kind_of(Client)
  end
end
