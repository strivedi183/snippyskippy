# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Client < ActiveRecord::Base
  attr_accessible :address, :latitude, :longitude
  has_one :user, :as => :userable
  has_many :favorites, :inverse_of => :client
  has_many :bookings, :inverse_of => :client
  validates :address, :presence => true

  before_save :geocode
  private
  def geocode
    result = Geocoder.search(self.address).first

    if result.present?
      self.latitude = result.latitude
      self.longitude = result.longitude
    end
  end

  # def ranks
  #   favorites = Favorites.where(:client_id => self.id)
  #   @ranks = []
  #   @ranks[0] = favorities.where(:rank => 1).reverse.first
  #   @ranks[1] = favorities.where(:rank => 2).reverse.first
  #   @ranks[2] = favorities.where(:rank => 3).reverse.first
  #   @ranks
  # end

  # def favorites
  #   favorites = Favorites.where(:client_id => self.id)
  #   @client_favorites = favorites.where(:is_favorite => true)
  #   @client_favorites
  # end
end
