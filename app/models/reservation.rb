class Reservation < ApplicationRecord
	belongs_to :user
	belongs_to :listing
	has_one :payment

	validate :reserved? 
	validates :start_date, presence: true
	validates :end_date, presence: true

	before_create :compute_total_price

	def reserved?
		existing_reservations = Reservation.where(listing_id: self.listing.id)

	    existing_reservations.each do |r|
	      if (start_date..end_date).overlaps?(r.start_date..r.end_date)
	        errors.add(:checkin, "Those dates are booked.")
		  end
		end
	end

end
