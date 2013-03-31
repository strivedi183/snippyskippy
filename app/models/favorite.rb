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

  def latest_ranks(client)
    favorites = Favorites.where(:client_id => client.id)
    @ranks = []
    @ranks[0] = favorities.where(:rank => 1).order(:created_at).reverse.first
    @ranks[1] = favorities.where(:rank => 2).order(:created_at).reverse.first
    @ranks[2] = favorities.where(:rank => 3).order(:created_at).reverse.first
  end

  def latest_favorities(client)
  end
end
