# == Schema Information
#
# Table name: salons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Salon do
  describe '.create' do
    it 'has an id' do
      salon = Salon.create
      expect(salon.id).to_not be nil
    end
  end
end
