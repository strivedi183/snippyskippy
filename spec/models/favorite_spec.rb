# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  medium_id   :integer
#  client_id   :integer
#  rank        :integer
#  is_favorite :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Favorite do
  describe '.create' do
    it 'has an id' do
      favorite = Favorite.create(rank: 1)
      expect(favorite.id).to_not be nil
    end
  end
end
