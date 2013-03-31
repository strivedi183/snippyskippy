# == Schema Information
#
# Table name: bookings
#
#  id               :integer          not null, primary key
#  appointment_date :date
#  appointment_time :time
#  client_id        :integer
#  medium_id        :integer
#  stylist_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Booking < ActiveRecord::Base
  attr_accessible :appointment_date, :appointment_time, :client_id, :medium_id, :stylist_id
  belongs_to :client, :inverse_of => :bookings
  belongs_to :medium, :inverse_of => :bookings
  belongs_to :stylist, :inverse_of => :bookings
end
