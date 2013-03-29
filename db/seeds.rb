Client.delete_all
Favorite.delete_all
Medium.delete_all
Medium_tag.delete_all
Salon.delete_all
Stylist.delete_all
User.delete_all

u1 = User.create(:name => 'Joan Osborne', :email => 'g1ofus@gmail.com', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'God', :email => 'god@gmail.com', :password => 'a', :password_confirmation => 'a', :is_admin => true )
u3 = User.create(:name => 'Snippy', :email => 'snip@gmail.com', :password => 'a', :password_confirmation => 'a')