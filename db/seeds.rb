Client.delete_all
Favorite.delete_all
Medium.delete_all
Tag.delete_all
Salon.delete_all
Stylist.delete_all
User.delete_all

u1 = User.create(:name => 'Joan Osborne', :email => 'j@gmail.com', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'God', :email => 'god@gmail.com', :password => 'a', :password_confirmation => 'a')
u2.is_admin = true
u2.save
u3 = User.create(:name => 'Snippy', :email => 'snip@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/4lo1rvydwdr6l9r/mads2.jpg', :password => 'a', :password_confirmation => 'a')

s1 = Stylist.create
s1.user = u3

c1 = Client.create(:address => 'nyc')
c1.user = u1

t1 = Tag.create(:tag => 'blonde')
t2 = Tag.create(:tag => 'ginger')
t3 = Tag.create(:tag => 'short')
t4 = Tag.create(:tag => 'punk')
t5 = Tag.create(:tag => 'curly')
t6 = Tag.create(:tag => 'bangs')