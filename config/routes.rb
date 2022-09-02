Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "travels#index"

  resources :travels do
    post 'order', on: :member
    

    get 'successfull', on: :member
  end

  get "/about", to: "travels#about"

  get "/tours", to: "travels#tours"
  get "/tours/:id", to: "travels#show"

  get "/tours/new/:id", to: "travels#new"

  get "/gallery", to: "travels#gallery"

  get "/information", to: "travels#information"
  get "/search", to: "travels#search" 
end
