Rails.application.routes.draw do
  root 'homes#top'
  get '/home/about', to: 'homes#about'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only: [:new, :index, :show, :update, :edit]
end