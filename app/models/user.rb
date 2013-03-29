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

  def is_client?
    true if self.userable.is_a?(Client)
  end

  def is_stylist?
    true if self.userable.is_a?(Stylist)
  end
end
