# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  image           :text
#  password_digest :string(255)
#  userable_id     :integer
#  userable_type   :string(255)
#  is_admin        :boolean          default(FALSE)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :name, :email, :image, :password, :password_confirmation
  has_secure_password
  belongs_to :userable, :polymorphic => true
  validates :email, :presence => true
  mount_uploader :image, PhotoUploader

  def is_client?
    true if self.userable.is_a?(Client)
  end

  def client
    self.userable if self.is_client?
  end

  def is_stylist?
    true if self.userable.is_a?(Stylist)
  end

  def stylist
    self.userable if self.is_stylist?
  end

  def sendtxt
    if self != nil
      body = 'Congrats, ' + self.name.split(" ")[0] + ' your registration is complete!'
      client = Twilio::REST::Client.new(ENV['TW_SID'], ENV['TW_TOK'])
      client.account.sms.messages.create(:from => ENV['TW_PHONE'], :to => self.client.phone, :body => body)
    end
  end

  def sendemail
    if self != nil
      self.name = name
      self.email = email
      Notifications.registration_message(name, email).deliver
    end
  end
end
