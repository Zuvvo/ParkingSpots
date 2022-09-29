class MainController < ApplicationController
  def index
    @spots = Spot.all.sort_by {|x| x['id']}
  end
end