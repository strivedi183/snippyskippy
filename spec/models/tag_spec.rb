# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Tag do
  describe '.create' do
    it 'has an id' do
      tag = Tag.create
      expect(tag.id).to_not be nil
    end
  end
end
