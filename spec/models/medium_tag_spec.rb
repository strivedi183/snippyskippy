# == Schema Information
#
# Table name: medium_tags
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Medium_tag do
  describe '.create' do
    it 'has an id' do
      medium = Medium_tag.create
      expect(medium_tag.id).to_not be nil
    end
  end
end
