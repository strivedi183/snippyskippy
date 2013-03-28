FactoryGirl.define do
  factory :stylist, class: Stylist do
    name 'Bob'
    user    {FactoryGirl.create(:stylist_user)}
  end
end