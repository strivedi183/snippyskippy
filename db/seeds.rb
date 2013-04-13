Client.delete_all
Favorite.delete_all
Medium.delete_all
Tag.delete_all
Salon.delete_all
Stylist.delete_all
User.delete_all

u1 = User.create(:name => 'Joan Osborne', :email => 'j@gmail.com', :password => 'a', :password_confirmation => 'a')
u2 = User.create(:name => 'God', :email => ENV['EMAIL'], :password => 'a', :password_confirmation => 'a')
u2.is_admin = true
u2.save
u3 = User.create(:name => 'Snippy', :email => 'snip@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/4lo1rvydwdr6l9r/mads2.jpg', :password => 'a', :password_confirmation => 'a')
u4 = User.create(:name => 'Vincenzo', :email => 'v@gmail.com', :image => 'http://www.beautycollectivesalon.com/_wp/wp-content/uploads/2012/08/Beauty-Collective-Hair-Salon-Tarek-Makki.jpg', :password => 'a', :password_confirmation => 'a')
u5 = User.create(:name => 'Kennith', :email => 'k@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/cnwocu8ndf4j5y1/images%20(1).jpeg', :password => 'a', :password_confirmation => 'a')
u6 = User.create(:name => 'Sam', :email => 's@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/fe1y3rwx3tc5jvd/sam.jpg', :password => 'a', :password_confirmation => 'a')
u7 = User.create(:name => 'Michael', :email => 'm@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/jazwqiveqxb8itc/stylist.jpeg', :password => 'a', :password_confirmation => 'a')
u8 = User.create(:name => 'Anita', :email => 'a@gmail.com', :image => 'https://s3.amazonaws.com/uploads.hipchat.com/38251/267262/m8wbkc9bf3vzq49/Carmena-Victoria-Wardrobe-Stylist-San-Francisco-photo.jpg', :password => 'a', :password_confirmation => 'a')

s1 = Stylist.create
s1.user = u3
s2 = Stylist.create
s2.user = u4
s3 = Stylist.create
s3.user = u5
s4 = Stylist.create
s4.user = u6
s5 = Stylist.create
s5.user = u7
s6 = Stylist.create
s6.user = u8

c1 = Client.create(:address => 'nyc', :phone => ENV['PHONE'])
c1.user = u1
c2 = Client.create(:address => 'nyc', :phone => ENV['PHONE'])
c2.user = u2

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

n1 = Salon.create(:name => 'Snippy Salon', :address => 'Chelsea, NY')
n2 = Salon.create(:name => 'Vincenzo Salon', :address => 'Midtown, NY')
n3 = Salon.create(:name => 'Greatful Head', :address => 'West Village, NY')
n4 = Salon.create(:name => 'British Hairways', :address => 'East Village, NY')
n5 = Salon.create(:name => 'Eclips', :address => 'Brooklyn, NY')
n6 = Salon.create(:name => 'Anita Hircut', :address => 'Harlem, NY')

n1.stylists << s1
n2.stylists << s2
n3.stylists << s3
n4.stylists << s4
n5.stylists << s5
n6.stylists << s6
