class ReservationJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    # Do something later
    ReservationMailer.reservation_email(reservation).deliver_later
  end
end
