Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get "/auth/slack/callback", to: "omniauth_callbacks#slack"

  resources :spots

  root to: "main#index"

end
