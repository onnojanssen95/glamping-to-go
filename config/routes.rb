Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :glamping_set, only: [:new, :create, :show, :index] do
    resources :bookings, only: [:index, :new, :show, :create]
  end
  resources :bookings, only: [:delete]
  # resources :users, only: [:new, :show, :create]

end
