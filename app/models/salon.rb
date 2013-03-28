# == Schema Information
#
# Table name: salons
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  address    :string(255)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Salon < ActiveRecord::Base
  attr_accessible :name, :address, :latitude, :longitude
  has_many :stylists, :inverse_of => :salon
end
