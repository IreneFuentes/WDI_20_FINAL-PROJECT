class BookingMailer < ApplicationMailer

  def booking_received(booking_id)
    @booking = Booking.find(booking_id)
    admin = Role.find_by(name: :admin).users.first

    mail(to: admin.email, subject: 'New Booking Received')
  end

  def booking_confirmed(booking_id)
    @booking = Booking.find(booking_id)

    mail(to: @booking.user.email, subject: 'Your booking has been confirmed')
  end

  def booking_rejected(booking_id)
    @booking = Booking.find(booking_id)
    mail(to: @booking.user.email, subject: 'Your booking has been rejected')
  end

  def booking_pending(booking_id)
    @booking = Booking.find(booking_id)
    mail(to: @booking.user.email, subject: 'Your booking is pending confirmation')
  end

end