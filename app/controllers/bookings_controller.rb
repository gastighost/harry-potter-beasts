class BookingsController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
    @bookings = Booking.all
  end

  def new
    @creature = Creature.find(params[:creature_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @creature = Creature.find(params[:creature_id])
    @booking.creature = @creature
    @booking.user = current_user
    if @booking.save
      redirect_to creature_path(@creature)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to creature_path(@booking.creature)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_day, :end_day)
  end
end
