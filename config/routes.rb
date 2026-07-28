Rails.application.routes.draw do
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resource :settings, only: %i[ edit update ]
  delete "settings/avatar", to: "settings#remove_avatar", as: :remove_avatar
  resources :users, only: %i[ index update ]

  root "dashboard#index"

  # Authentication routes
  get    "login",  to: "sessions#new",     as: :new_session
  post   "login",  to: "sessions#create",  as: :session
  delete "logout", to: "sessions#destroy", as: :destroy_session

  get  "signup", to: "registrations#new",    as: :new_registration
  post "signup", to: "registrations#create", as: :registration

  get   "forgot-password",       to: "passwords#new",    as: :new_password
  post  "forgot-password",       to: "passwords#create", as: :passwords
  get   "reset-password/:token", to: "passwords#edit",   as: :edit_password
  patch "reset-password/:token", to: "passwords#update", as: :password
end
