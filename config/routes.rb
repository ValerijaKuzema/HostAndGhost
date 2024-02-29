Rails.application.routes.draw do
  devise_for :users
  root to: "places#index"
  resources :places do
    resources :bookings, only: [:create]
    resources :reviews, only: [:create]
  end

  resources :bookings, only: [:index, :show, :destroy]
  resources :reviews, only: [:create]
end
