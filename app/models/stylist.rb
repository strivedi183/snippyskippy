# == Schema Information
#
# Table name: stylists
#
#  id         :integer          not null, primary key
#  salon_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Stylist < ActiveRecord::Base
  attr_accessible :salon_id
  has_one :user, :as => :userable
  belongs_to :salon, :inverse_of => :stylists
  has_many :media, :inverse_of => :stylist

  def stylist_favorities
    @favorites = Favorite.where(:stylist_id => self.id).order(:created_at).reverse
    @favorites
  end
end
