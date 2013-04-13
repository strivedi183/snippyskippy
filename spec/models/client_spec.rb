# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  phone      :string(255)
#

require 'spec_helper'

describe Client do
  describe '.create' do
    it 'has an id' do
      client = Client.create(address: 'New York')
      expect(client.id).to_not be nil
    end
    it 'fails validation if address is not present' do
      client = Client.create
      expect(client.id).to be nil
    end
  end

  context 'the client must be present' do
    let(:client) {Client.create(address: 'New York')}

    describe '#user' do
      it 'has a user' do
        user = FactoryGirl.create(:client_user)
        client.user = user
        expect(client.user).to eq user
      end
    end

    describe '#geocoder' do
      it 'captures a lat and long' do
        user = FactoryGirl.create(:client_user)
        client.user = user
        result = Geocoder.search(user.client.address).first
        expect(result.present?).to be true
      end
    end
  end
end
