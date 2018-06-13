Rails.application.routes.draw do
  get 'feed', to: 'feed#index'
  resources :users

  get 'home/show'
  root to: "home#show"

  get 'login', to: redirect('/auth/google'), as: 'login'
  get '/auth/google/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
