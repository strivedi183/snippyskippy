# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  medium_id   :integer
#  client_id   :integer
#  rank        :integer
#  is_favorite :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Favorite < ActiveRecord::Base
  attr_accessible :rank, :client_id, :medium_id, :is_favorite
  belongs_to :client, :inverse_of => :favorites
  belongs_to :medium, :inverse_of => :favorites

  def latest_ranks(client)
    favorites = Favorites.where(:client_id => client.id)
    @ranks = []
    @ranks[0] = favorities.where(:rank => 1).order(:created_at).reverse.first
    @ranks[1] = favorities.where(:rank => 2).order(:created_at).reverse.first
    @ranks[2] = favorities.where(:rank => 3).order(:created_at).reverse.first
    @ranks
  end

  def latest_favorities(client)
    favorites = Favorites.where(:client_id => client.id)
    @client_favorites = favorites.where(:is_favorite => true)
    @client_favorites
  end

  def stylist_favorities(stylist)
    @favorites = Favorite.where(:stylist_id => stylist.id).order(:created_at).reverse
    @favorites
  end
end
