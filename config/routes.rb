Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  root to: 'tradings#index'
  resources :items
  resources :tradings, only:[:create]
end
