class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
  end

  def new
    @booking = Booking.new
    @glamping_set = GlampingSet.find(params[:glamping_set_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @glamping_set = GlampingSet.find(params[:glamping_set_id])

    @booking.glamping_set = @glamping_set
    @booking.user = current_user
    if @booking.save
      redirect_to glamping_set_bookings_path
    else
      render :new
    end
  # No need for app/views/bookings/create.html.erb
    # redirect_to booking_path(@booking)
  end


  def show
    @booking = Booking.find(params[:id])
  end


  def destroy
    @booking.destroy
    redirect_to galm_path, status: :see_
  end

  # def destroy
  #   @list.destroy
  #   redirect_to lists_path, status: :see_other
  # end


  private

  def booking_params
    params.require(:booking).permit(:start_Date, :end_date, :price_per_night, :pickup_type)
  end




end
