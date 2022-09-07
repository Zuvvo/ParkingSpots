Rails.application.routes.draw do

  get "sign_up", to: "registration#new"
  post "sign_up", to: "registration#create"

  resources :spots

  root to: "main#index"

end
