Rails.application.routes.draw do
  devise_for :users
  root to: 'groups#index'
  resources :users, only: [:update, :edit]
  resources :groups, only: [:new, :create, :edit, :update] do 
    resources :messages, only: [:index, :create]
  end
end
