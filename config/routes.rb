Rails.application.routes.draw do
  root 'sessions#new'

  resources :votes
  resources :candidates
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  get 'sign_in', to: 'sessions#new', as: :sign_in
  get 'sign_out', to: 'sessions#destroy', as: :sign_out

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
