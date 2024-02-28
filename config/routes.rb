Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  resources :places do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :show]
  resources :reviews, only: [:create]
end
