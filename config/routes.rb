Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :places
  resources :bookings, only: [:index, :show]
  resources :reviews, only: [:create]
end
