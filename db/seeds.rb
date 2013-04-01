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
u4 = User.create(:name => 'Vincenzo', :email => 'v@gmail.com', :image => 'http://www.beautycollectivesalon.com/_wp/wp-content/uploads/2012/08/Beauty-Collective-Hair-Salon-Tarek-Makki.jpg', :password => 'a', :password_confirmation => 'a')

s1 = Stylist.create
s1.user = u3
s2 = Stylist.create
s2.user = u4

c1 = Client.create(:address => 'nyc')
c1.user = u1

t1 =  Tag.create(:tag => 'blonde')
t2 =  Tag.create(:tag => 'black')
t3 =  Tag.create(:tag => 'brunette')
t4 =  Tag.create(:tag => 'redhead')
t5 =  Tag.create(:tag => 'short')
t6 =  Tag.create(:tag => 'long')
t7 =  Tag.create(:tag => 'straight')
t8 =  Tag.create(:tag => 'curly')
t9 =  Tag.create(:tag => 'wavy')
t10 = Tag.create(:tag => 'bangs')
t11 = Tag.create(:tag => 'bob')
t12 = Tag.create(:tag => 'punk')
t13 = Tag.create(:tag => 'preppie')
