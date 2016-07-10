class AdminController < ApplicationController
  
  def admin
  end

  def users
  end

  def bookings
    @bookings = Booking.all.order('created_at desc')
  end

  def comments
  end

  def confirm
    booking = Booking.find_by_id(params[:id])
    booking.status = :confirmed
    booking.save

    redirect_to admin_bookings_path
  end

  def reject
    booking = Booking.find_by_id(params[:id])
    booking.status = :rejected
    booking.save

    redirect_to admin_bookings_path
  end
end
