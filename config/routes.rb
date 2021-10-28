Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  # 機能実装後に追記する
  # :edit
end
