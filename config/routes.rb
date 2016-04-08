Rails.application.routes.draw do

  root       'headlines#index'
  devise_for :users
  resources  :headlines
  
end
