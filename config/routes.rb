Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'users#show', as: :user_profile
  get 'gardens/search', to: 'gardens#search', as: 'search_gardens'
  # get 'users/:id' => 'users#show'

  resources :events, only: [:index, :show] do
    resources :bookings, only: [:show, :create, :destroy]
    resources :reviews, only: [:destroy, :create]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :bookmarks, only: [:create, :destroy]



  resources :gardens do
    resources :events, only: [:index, :new, :create]
    resources :reviews, only: [:destroy, :create]
    resources :parcels, only: [:new, :create, :index, :show]

  end


  resources :parcels do
    resources :parcel_reservations, only: [:new, :create, :update]
  end


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
