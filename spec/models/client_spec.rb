require 'spec_helper'

describe Client do
  describe '.create' do
    it 'has an id' do
      client = Client.create(name: 'bob')
      expect(client.id).to_not be nil
    end
    it 'fails validation if name is not present' do
      client = Client.create
      expect(client.id).to be nil
    end
  end

  context 'the client must be present' do
    let(:client) {Client.create(name: 'bob')}

    describe '#user' do
      it 'has a user' do
        user = FactoryGirl.create(:client_user)
        client.user = user
        expect(client.user).to eq user
      end
    end
  end
end