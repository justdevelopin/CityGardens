Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get '/profile', to: 'users#show', as: :user_profile

  get 'users/:id' => 'users#show'
  resources :events, only: [:index, :show] do
    resources :bookings, only: [:show, :create, :destroy]
    resources :reviews, only: [:destory, :create ]
    resources :bookmarks, only: [:create, :destroy]
  end

  resources :gardens do
    resources :events, only: [:new, :create]
    resources :reviews, only: [:destroy, :create ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
