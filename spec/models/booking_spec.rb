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

require 'spec_helper'

describe Booking do
  describe '.create' do
    it 'has an id' do
      booking = Booking.create(apt_time: '12:00')
      expect(booking.id).to_not be nil
    end
  end
end
