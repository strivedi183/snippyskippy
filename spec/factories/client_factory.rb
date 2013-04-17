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
#  phone      :string(255)
#

FactoryGirl.define do
  factory :client, class: Client do
    address 'New York'
    phone "#{ENV['PHONE']}"
    user    {FactoryGirl.create(:client_user)}
  end
end
