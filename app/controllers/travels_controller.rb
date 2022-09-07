require "pry"
require "uri"
require "net/http"
require "json"
class TravelsController < ApplicationController
  def index
    
  end

  def tours
    @tours = Tour.all
  end

  def show
    @tour = Tour.find_by(id:params[:id])
  end

  def new
    @tour = Tour.find_by(id:params[:id])
  end

  def order
# creating order
    @tour = Tour.find_by(id:params[:id])
    info = {
      "order": {

        "order_lines_attributes": [
          {
            "product_id"=> (@tour.insales_id),
            "quantity"=> (params[:tour]["quantity"]),
            "sale_price" => (@tour.cost)
          },
          {
            "product_id"=> 320181375,
            "quantity"=> (params[:tour]["rooms_two"].to_i + params[:tour]["rooms_three"].to_i + params[:tour]["rooms_four"].to_i),
            "sale_price" => (params[:tour]["hotel"].to_i * params[:tour]["quantity"].to_i)
          },
          {
            "product_id"=> 320210766,
            "quantity"=> (params[:tour]["quantity"]),
            "sale_price" => (params[:tour]["trans"].to_i)
          },
          {
            "product_id"=> 320412270,
            "quantity"=> (params[:tour]["quantity"]),
            "sale_price" => (params[:tour]["eat"].to_i)
          },
          {
            "product_id"=> 320412768,
            "quantity"=> (params[:tour]["quantity"]),
            "sale_price" => (params[:tour]["excursion"].to_i)
          }
        ],

        "client": {
          "id" => 54128887,
          "name" => (params[:tour]["full_name"]),
          "email" => (params[:tour]["email"]),
          "phone" => "77777777777",
          "consent_to_personal_data"=> true
        },
        "shipping_address": {
        
          "full_locality_name"=> "г. Москва, Новорязанская18с11"
        },

        "delivery_variant_id"=> 3030673,
        "payment_gateway_id"=> 1424329
      }

    }

    uri = URI("http://myshop-bpk700.myinsales.ru/admin/orders.json")
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.basic_auth("1a8db035b2414bf12174450baaa309b5", "b16753ff04a4b1927408adad7c889e05")
    request.body = info.to_json
    response = http.request(request)
    info_order = JSON.parse(response.body)
    puts params[:tour]["rooms_two"]
# inputs params in DB Order
    if params[:tour]["hotel"].to_i == @tour.hotel_lux
      hotel = "hotel_lux"
    elsif params[:tour]["hotel"].to_i == @tour.hotel_standart
      hotel = "hotel_standart"
    else
      hotel = "hotel_budget"
    end

    if params[:tour]["eat"].to_i == @tour.cost_eat
      eat = "eat"
    else
      eat = "no eat"
    end

    if params[:tour]["trans"].to_i == @tour.transfer
      trans = "Yes"
    else
      trans = "Not"
    end

    if params[:tour]["excursion"].to_i == @tour.excursion
      excursion = "Yes"
    else
      excursion = "Not"
    end

    @order = Order.new(tour_id:@tour.id, insales_order:info_order["order_lines"][0]["order_id"], email:params[:tour]["email"], name:params[:tour]["full_name"], quantity:params[:tour]["quantity"].to_i, days:params[:tour]["quantity_days"].to_i, trans:"Yes", hotel:hotel, eat:eat, room_two:params[:tour]["rooms_two"].to_i , rooms_three:params[:tour]["rooms_three"].to_i , rooms_four: params[:tour]["rooms_four"].to_i, excursion:excursion)
    
    if @order.save
      redirect_to successfull_travel_path(@order.id)
    else
      render :root, status: :unprocessable_entity
    end
  end

  def gallery
    @photos = Gallery.all
  end

  def successfull
    @order = Order.find_by(id:params["id"])
  end

  def search
    @order = Order.find_by(id:params['query'])
    @tour = Tour.find_by(id:@order.tour_id)
  end

  private
  def orders_details
    params.require(:tour).permit(:email, :full_name, :quantity, :sum_quantity)
  end
end
