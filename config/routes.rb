Rails.application.routes.draw do

  root to: 'visitors#index'

  resources :users, only: :show
  resources :gists do
    member do
      post 'updatetags'
    end
  end

  resources :tags, only: :index
  resources :searches, only: :create

  get '/auth/:provider/callback' => 'sessions#create'
  get '/signin' => 'sessions#new', as: :signin
  get '/signout' => 'sessions#destroy', as: :signout
  get '/auth/failure' => 'sessions#failure'
  get '/dummydetail' => 'visitors#detail'

  resource :sync, only: :create
end
