require 'spec_helper'

describe Booking do
  describe '.create' do
    it 'has an id' do
      booking = Booking.create(apt_time: '12:00')
      expect(booking.id).to_not be nil
    end
  end
end