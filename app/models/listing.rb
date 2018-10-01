class Listing < ApplicationRecord
	attr_accessor :image
	belongs_to :user
	has_many :reservations
	has_many :payments
	mount_uploaders :images, ImageUploader

	scope :location, -> (location) { where("location like ?", "#{location}%")}
	scope :room_type, -> (room_type) { where room_type: room_type}
	scope :guest, -> (guest) { where guest: guest}

	# def self.search(search)
	# 	if search
	# 		where("location LIKE ?", "%#{search}")
	# 	else
	# 	end
	# end

	def self.search_location(query)
		where('location ILIKE :location', location: "%#{query}%").map do |record|
			record.location
		end
	end
end
