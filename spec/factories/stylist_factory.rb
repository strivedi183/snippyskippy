# == Schema Information
#
# Table name: stylists
#
#  id         :integer          not null, primary key
#  salon_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  bio        :text
#

FactoryGirl.define do
  factory :stylist, class: Stylist do
    user    {FactoryGirl.create(:stylist_user)}
  end
end
