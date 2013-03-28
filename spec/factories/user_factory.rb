FactoryGirl.define do
  factory :generic_user, class: User do
    username              'generic'
    email                 'generic@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :client_user, class: User do
    username              'client'
    email                 'client@gmail.com'
    password              'a'
    password_confirmation 'a'
  end

  factory :stylist_user, class: User do
    username              'stylist'
    email                 'stylist@gmail.com'
    password              'a'
    password_confirmation 'a'
  end
end