require 'spec_helper'

describe Medium_tag do
  describe '.create' do
    it 'has an id' do
      medium = Medium_tag.create
      expect(medium_tag.id).to_not be nil
    end
  end
end