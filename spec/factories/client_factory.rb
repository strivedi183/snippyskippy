FactoryGirl.define do
  factory :client, class: Client do
    name 'Bob'
    user    {FactoryGirl.create(:client_user)}
  end
end