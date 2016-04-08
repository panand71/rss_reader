Rails.application.routes.draw do

  resources :entries
  resources :feeds
  root       'feeds#index'
  devise_for :users
  
end
