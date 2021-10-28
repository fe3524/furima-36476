Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:index, :new, :create]
  # 機能実装後に追記する
  # :edit, :show
end
