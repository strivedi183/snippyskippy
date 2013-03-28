require 'spec_helper'

describe Favorite do
  describe '.create' do
    it 'has an id' do
      favorite = Favorite.create(rank: 1)
      expect(favorite.id).to_not be nil
    end
  end
end