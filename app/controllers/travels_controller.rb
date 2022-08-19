require "pry"
class TravelsController < ApplicationController
  def index
    
  end

  def tours
    @tours = Tour.all
  end

  def show
    @tour = Tour.find_by(params[:id])
  end

  def new
    @tour = Tour.find_by(params[:id])
  end

  def create
    url = "https://1a8db035b2414bf12174450baaa309b5:b16753ff04a4b1927408adad7c889e05@myshop-bpk700.myinsales.ru/admin/orders.json"
    binding.pry
    
    
    redirect_to :root
  end

  private
  def orders_details
    params.require(:tour).permit(:email, :full_name, :quantity, :sum_quantity)
  end
end
