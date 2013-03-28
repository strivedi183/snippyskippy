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
end
