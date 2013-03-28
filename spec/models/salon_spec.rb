require 'spec_helper'

describe Salon do
  describe '.create' do
    it 'has an id' do
      salon = Salon.create
      expect(salon.id).to_not be nil
    end
  end
end