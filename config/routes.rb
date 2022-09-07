Rails.application.routes.draw do

  resources :spots

  root to: "main#index"

end
