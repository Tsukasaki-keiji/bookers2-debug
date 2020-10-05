Rails.application.routes.draw do
  root 'homes#top'
  get '/home/about', to: 'homes#about'
  get '/search', to: 'searches#search'
  devise_for :users
  root 'comment#index'

  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :relationships, only: [:index, :create, :destroy]
  resources :users, only: [:new, :index, :show, :update, :edit] do
     member do
      get :followings, :followers
     end
  end
end