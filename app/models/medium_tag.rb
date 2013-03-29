# == Schema Information
#
# Table name: medium_tags
#
#  id         :integer          not null, primary key
#  tag        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Medium_tag < ActiveRecord::Base
  attr_accessible :tag
  has_and_belongs_to_many :media
end
