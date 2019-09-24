require 'client'

describe Client do
  it 'creates a new client' do
    client_a = Client.new
    expect(client_a).to be_a_kind_of(Client)
  end
end
