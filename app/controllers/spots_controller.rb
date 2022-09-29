class SpotsController < ApplicationController

  #before_action :require_user_logged_in!
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def update
    days = params[:spot][:days].to_i
    hours = params[:spot][:hours].to_i
    if days <= 0 && hours <= 0
      flash[:alert] = "You need to make a reservation for at least 1 hour"
      render :edit
    else
      time_in_hours = days * 24 + hours
      @spot.update(book_time: Time.now, user_id: current_user.id, reservation_time: time_in_hours)
      redirect_to root_path, notice: "Parking spot #{@spot.id} reserved from #{@spot.book_time_start_in_local_time} to #{@spot.book_time_end_in_local_time}"
    end

    #render plain: params
  end

  def destroy
    @spot.cancel_reservation
    redirect_to root_path, notice: "Parking spot #{@spot.id} reservation canceled"
  end

  def set_spot
    @spot = Spot.all.find(params[:id])
  end
end