class TravelsController < ApplicationController
  def index
    
  end

  def tours
    @tours = Tour.all
  end
end
