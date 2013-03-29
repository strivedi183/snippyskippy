# == Schema Information
#
# Table name: media
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  url         :text
#  type        :string(255)
#  description :text
#  stylist_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Medium do
  describe '.create' do
    it 'has an id' do
      medium = Medium.create(title: 'buzz cut')
      expect(medium.id).to_not be nil
    end
  end
end
