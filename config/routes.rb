Rails.application.routes.draw do

  resources :users
  resources :gists
  resources :tags, only: :index
  root to: 'visitors#index'

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

  resource :sync, only: :create
end
