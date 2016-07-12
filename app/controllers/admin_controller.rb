class AdminController < ApplicationController

  def admin
  end

  def users
    @users = User.all.order('created_at desc')
  end

  def bookings
    @bookings = Booking.all.order('created_at desc')
  end

  def comments
     @comments = Comment.all.order('created_at desc')
  end

  def confirm
    booking = Booking.find_by_id(params[:id])
    booking.status = :confirmed
    booking.save

    BookingMailer.booking_confirmed(booking.id).deliver_now

    redirect_to admin_bookings_path
  end

  def reject
    booking = Booking.find_by_id(params[:id])
    booking.status = :rejected
    booking.save

    BookingMailer.booking_rejected(booking.id).deliver_now

    redirect_to admin_bookings_path
  end

  def destroy_user
 
     user = User.find_by_id(params[:id])
     user.destroy

     redirect_to admin_users_path
  end

  def destroy_comment
 
 comment = Comment.find_by_id(params[:id])
 comment.destroy

 redirect_to admin_comments_path
  end



end
