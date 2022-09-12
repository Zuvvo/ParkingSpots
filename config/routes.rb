Rails.application.routes.draw do

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  get "log_in", to: "sessions#new"
  post "log_in", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  resources :spots

  root to: "main#index"

end
