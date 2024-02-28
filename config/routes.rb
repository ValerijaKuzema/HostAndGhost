Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :places do
    resources :bookings, only: [:create]
  end

  resources :bookings, only: [:index, :show]
end
