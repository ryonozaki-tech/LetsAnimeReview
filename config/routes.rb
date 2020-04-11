Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: :index
  resources :posts
  resources :users, only: :show
end
