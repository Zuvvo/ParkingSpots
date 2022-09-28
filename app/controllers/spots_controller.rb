class SpotsController < ApplicationController

  #before_action :require_user_logged_in!
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def update
    redirect_to root_path, notice: "todo: parking spot edit data"
  end

  def set_spot
    @spot = Spot.all.find(params[:id])
  end
end