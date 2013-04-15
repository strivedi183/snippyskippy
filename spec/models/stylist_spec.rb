# == Schema Information
#
# Table name: stylists
#
#  id         :integer          not null, primary key
#  salon_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bio        :text
#

require 'spec_helper'

describe Stylist do
  describe '.create' do
    it 'has an id' do
      stylist = Stylist.create
      expect(stylist.id).to_not be nil
    end
  end

  context 'the stylist must be present' do
    let(:stylist) {Stylist.create}

    describe '#user' do
      it 'has a user' do
        user = FactoryGirl.create(:stylist_user)
        stylist.user = user
        expect(stylist.user).to eq user
      end
    end
  end
end
