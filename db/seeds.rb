Client.delete_all
Favorite.delete_all
Medium.delete_all
Medium_tag.delete_all
Salon.delete_all
Stylist.delete_all
User.delete_all

u1 = User.create(:name => 'Joan Osborne', :email => 'j@gmail.com', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'God', :email => 'god@gmail.com', :password => 'a', :password_confirmation => 'a')
u2.is_admin = true
u2.save
u3 = User.create(:name => 'Snippy', :email => 'snip@gmail.com', :password => 'a', :password_confirmation => 'a')

s1 = Stylist.create
s1.user = u3

c1 = Client.create(:address => 'nyc')
c1.user = u1