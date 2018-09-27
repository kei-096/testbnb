class Listing < ApplicationRecord
	attr_accessor :image
	belongs_to :user
	has_many :reservations
	has_many :payments
	mount_uploaders :images, ImageUploader
end
