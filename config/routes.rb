Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "travels#index"
  get "/tavels", to: "travels#index"
  get "/about", to: "travels#about"
  get "/tours", to: "travels#tours"
end
