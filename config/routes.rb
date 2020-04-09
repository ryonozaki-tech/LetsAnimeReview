Rails.application.routes.draw do
  devise_for :users
  get 'posts/index'

  root "posts#index"
  resources :users
end
