Rails.application.routes.draw do
  root 'homes#top'
  get '/home/about', to: 'homes#about'
  devise_for :users
  root 'comment#index'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resources :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:new, :index, :show, :update, :edit]
end