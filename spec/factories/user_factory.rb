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

FactoryGirl.define do
  factory :generic_user, class: User do
    name                  'generic'
    email                 'generic@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :client_user, class: User do
    name                  'client'
    email                 'client@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :stylist_user, class: User do
    name                  'stylist'
    email                 'stylist@gmail.com'
    password              'a'
    password_confirmation 'a'
  end
end
