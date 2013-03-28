require 'spec_helper'

describe Stylist do
  describe '.create' do
    it 'has an id' do
      stylist = Stylist.create(name: 'bob')
      expect(stylist.id).to_not be nil
    end
    it 'fails validation if name is not present' do
      stylist = Stylist.create
      expect(stylist.id).to be nil
    end
  end

  context 'the stylist must be present' do
    let(:stylist) {Stylist.create(name: 'bob')}

    describe '#user' do
      it 'has a user' do
        user = FactoryGirl.create(:stylist_user)
        stylist.user = user
        expect(stylist.user).to eq user
      end
    end
  end
end