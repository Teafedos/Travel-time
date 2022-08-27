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
    
    @tour = Tour.find_by(id:params[:id])

    binding.pry
    info = {
      "order": {

        "order_lines_attributes": [
          {
            "product_id"=> (@tour.insales_id),
            "quantity"=> (params[:tour]["quantity"]),
            "sale_price" => 10
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
        "payment_gateway_id"=> 1424329,
      }

    }

    uri = URI("http://myshop-bpk700.myinsales.ru/admin/orders.json")
    http = Net::HTTP.start(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.path, 'Content-Type' => 'application/json')
    request.basic_auth("1a8db035b2414bf12174450baaa309b5", "b16753ff04a4b1927408adad7c889e05")
    request.body = info.to_json
    response = http.request(request)
    puts response.body
    
    
    
    redirect_to :root
  end

  def gallery
    @photos = Gallery.all
  end

  private
  def orders_details
    params.require(:tour).permit(:email, :full_name, :quantity, :sum_quantity)
  end
end
