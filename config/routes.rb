Rails.application.routes.draw do

  root       'entries#index'

  devise_for :users

  resources :favorites
  resources :entries 
  post 'entries/:id/favorite' => 'entries#favorite'

  
end
