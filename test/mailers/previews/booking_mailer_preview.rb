class BookingMailerPreview < ActionMailer::Preview
  
  def booking_received
    booking = Booking.all.sample

    BookingMailer.booking_received(booking.id)
  end

  def booking_confirmed
    booking = Booking.all.sample

    BookingMailer.booking_confirmed(booking.id)
  end

  def booking_rejected
    booking = Booking.all.sample
    
    BookingMailer.booking_rejected(booking.id)
  end

  def booking_pending
    booking = Booking.all.sample

    BookingMailer.booking_pending(booking.id)
  end
end