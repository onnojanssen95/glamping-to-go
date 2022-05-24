class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
  end

  def create
    
  end

  # def show

  # end

  def destroy
    @booking.destroy
    redirect_to galm_path, status: :see_
  end

  # def destroy
  #   @list.destroy
  #   redirect_to lists_path, status: :see_other
  # end





end
