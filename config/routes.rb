Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks',
    confirmations: 'users/confirmations',
  }


  resources :spots
  patch "/spots/:id/edit", to: "spots#update"

  root to: "main#index"

end
