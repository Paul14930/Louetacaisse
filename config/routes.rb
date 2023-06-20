Rails.application.routes.draw do
  resources :bookings
  resources :voitures
  devise_for :users
  root to: "voitures#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
