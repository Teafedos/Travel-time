Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "travels#index"

  resources :travels
  get "/about", to: "travels#about"

  get "/tours", to: "travels#tours"
  get "/tours/:id", to: "travels#show"

  get "/tours/new/:id", to: "travels#new"
end
