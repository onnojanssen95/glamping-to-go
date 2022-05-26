Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookings, only: [:destroy]
  resources :glamping_sets, only: [:new, :create, :show, :index, :destroy] do
    resources :bookings, only: [:index, :new, :show, :create]
  end
  # resources :users, only: [:new, :show, :create]
end
