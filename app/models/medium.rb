# == Schema Information
#
# Table name: media
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  medium      :text
#  type        :string(255)
#  description :text
#  stylist_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Medium < ActiveRecord::Base
  attr_accessible :title, :medium, :type, :description, :stylist_id, :remote_medium_url
  has_and_belongs_to_many :medium_tags
  belongs_to :stylist, :inverse_of => :media
  mount_uploader :url, MediaUploader
end
