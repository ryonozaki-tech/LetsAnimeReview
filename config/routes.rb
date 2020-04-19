Rails.application.routes.draw do
  # post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: [:index, :show]
  resources :posts do
    resources :comments, only: [:create, :show, :edit, :update]
    # resources :likes, only: :create
    resource :likes, only: [:create, :destroy, :show]
    collection do
      get 'search'
    end
  end
  resources :comments, only: :destroy
  # resources :likes, only: :destroy
  resources :users, only: [:show, :edit, :update]
end
