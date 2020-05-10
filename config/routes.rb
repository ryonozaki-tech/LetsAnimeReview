Rails.application.routes.draw do
  # post '/rate' => 'rater#create', :as => 'rate'
  devise_for :users
  # get 'posts/index'
  root "posts#index"
  
  resources :genres, only: [:index, :show] do
    member do
      get 'each_genre_ranking'
    end
  end
  resources :posts do
    resources :comments, only: [:create, :show, :edit, :update]
    resource :likes, only: [:create, :destroy, :show]
    collection do
      get 'search'
    end
    collection do
      get 'star_ranking'
    end
    collection do
      get 'like_ranking'
    end
  end
  resources :comments, only: :destroy
  resources :users, only: [:show, :edit, :update]
end
