# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  image           :text
#  password_digest :string(255)
#  userable_id     :integer
#  userable_type   :string(255)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  describe '.create' do
    it 'has an id' do
      user = User.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')
      expect(user.id).to_not be nil
    end
    it 'fails validation' do
      user = User.create
      expect(user.id).to be nil
    end
  end

  context 'requires a valid user, client and stylist' do
    let(:user) {User.create(name: 'bob', email: 'bob@gmail.com', password: 'a', password_confirmation: 'a')}
    let(:client) {FactoryGirl.create(:client)}
    let(:stylist) {FactoryGirl.create(:stylist)}

    describe '#client' do
      it 'returns a Client object' do
        client.user = user
        expect(user.client).to eq client
      end
      it 'return nil when the user is not a client' do
        stylist.user = user
        expect(user.client).to be nil
      end
    end

    describe '#stylist' do
      it 'returns a Stylist object' do
        stylist.user = user
        expect(user.stylist).to eq stylist
      end
      it 'return nil when the user is not a stylist' do
        client.user = user
        expect(user.stylist).to be nil
      end
    end
  end
end
