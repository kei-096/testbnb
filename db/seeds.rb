# Seed Users
user = {}
user['password'] = '112233'
# user['password_confirmation'] = '112233'

ActiveRecord::Base.transaction do
  80.times do 
    user['first_name'] = Faker::Name.first_name 
    user['last_name'] = Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['birthday'] = Faker::Date.between(50.years.ago, Date.today)

    User.create(user)
  end
end 

listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  50.times do 
    listing['room_type'] = ["Entire place", "Private room", "Shared room"].sample
    listing['guest'] = rand(1..16)
    listing['location'] = Faker::Address.city
    # listing.images << Rails.root.join("app/assets/images/#{airbnb1.jpg}").open
    listing['user_id'] = uids.sample
    listing['price'] = rand(80..500)
    listing['images'] = [
        Rails.root.join("app/assets/images/listing_image_samples/#{['airbnb1.jpg','airbnb2.jpg','airbnb3.jpg','airbnb4.jpg'].sample}").open, 
        Rails.root.join("app/assets/images/listing_image_samples/#{['airbnb1.jpg','airbnb2.jpg','airbnb3.jpg','airbnb4.jpg'].sample}").open
      ]

    Listing.create(listing)
  end
end

