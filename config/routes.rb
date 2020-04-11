Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: :index
 
  resources :posts, only: [:index, :new, :create, :show]
  resources :users, only: :show
end
