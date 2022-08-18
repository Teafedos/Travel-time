class TravelsController < ApplicationController
  def index
    
  end

  def tours
    @tours = Tour.all
  end

  def show
    @tour = Tour.find_by(params[:id])
  end

  def show
    @tour = Tour.find_by(params[:id])
  end
end
