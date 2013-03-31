# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  medium_id  :integer
#  client_id  :integer
#  rank       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ActiveRecord::Base
  attr_accessible :rank, :client_id, :medium_id
  belongs_to :client, :inverse_of => :favorites
  belongs_to :medium, :inverse_of => :favorites
end
