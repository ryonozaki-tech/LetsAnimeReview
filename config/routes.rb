Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: [:index, :show]
  resources :posts
  resources :users, only: [:show, :edit, :update]
end
