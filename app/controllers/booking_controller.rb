class BookingController < ApplicationController
  before_action :authenticate_user!

  def create
    # first created a new booking scoped to the current user
    booking = current_user.bookings.create(booking_params)
    booking.status = :pending
    booking.save
    # Notify manager with a new email
    BookingMailer.booking_received(booking.id).deliver_now
    # Notify current_user with a new email
    BookingMailer.booking_pending(booking.id).deliver_now
    
    redirect_to edit_user_registration_path(anchor: 'bookings'), notice: 'Booking created succesfully'
  end


  private

  def booking_params
    params.require(:booking).permit :date, :time, :massage_type, :note
  end
end