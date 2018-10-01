class ReservationMailer < ApplicationMailer
	default from: 'imotobnb@gmail.com'

	def reservation_email(reservation)
		@customer = reservation.user
		@host = reservation.listing.user
		@listing = reservation.listing

		mail(to: @customer.email, subject: "You're going to #{listing.location}!")
	end
end
