class MainController < ApplicationController
  def index
    @spots = Spot.all
  end
end