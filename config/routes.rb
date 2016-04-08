Rails.application.routes.draw do

  resources :entries
  resources :feeds
  root       'entries#index'
  devise_for :users
  
end
