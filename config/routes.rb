Rails.application.routes.draw do
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: [:index, :show]
  resources :posts do
    resources :comments, only: [:create, :show, :edit, :update, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
end
