Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :users, only: :show
  resources :gists
  resources :tags, only: :index
  resources :searches, only: :index

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'

  resource :sync, only: :create
end
