require 'spec_helper'

describe Medium do
  describe '.create' do
    it 'has an id' do
      medium = Medium.create(title: 'buzz cut')
      expect(medium.id).to_not be nil
    end
  end
end