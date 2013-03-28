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

class Medium < ActiveRecord::Base
  attr_accessible :title, :url, :type, :description, :stylist_id
  has_and_belongs_to_many :medium_tags
  belongs_to :stylist, :inverse_of => :media
end
