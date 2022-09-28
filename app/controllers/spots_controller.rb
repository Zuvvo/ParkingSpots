class SpotsController < ApplicationController

  #before_action :require_user_logged_in!
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index

  end

  def edit

  end

  def book

  end

  def set_spot
    @spot = Spot.all.find(params[:id])
  end
end