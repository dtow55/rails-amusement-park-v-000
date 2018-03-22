Rails.application.routes.draw do

  root "application#home"

  resources :users, only: [:new, :create, :index, :show]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  get '/signin', to: "sessions#new"
  post '/signin', to: "sessions#create"
  get '/logout', to: "sessions#destroy"
  post 'ride', to: "attractions#ride"
end