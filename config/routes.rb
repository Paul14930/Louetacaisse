Rails.application.routes.draw do
  resources :bookings
  resources :voitures
  devise_for :users
  root to: "voitures#index"
  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'

  end
  get 'current_user_car', to: 'voitures#current_user_car'
  # get 'voitures/:id/edit', to: 'voitures#edit', as: 'edit_voiture'
  delete 'voitures/:id', to: 'voitures#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # root to: "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
