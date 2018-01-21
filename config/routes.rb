Rails.application.routes.draw do
  devise_for :users
  resources :moviegroups do
    member do
      post :join
      post :quit      
    end
    resources :reviews
  end
  resources :reviews
  namespace :account do
    resources :moviegroups
    resources :reviews
  end
  root 'moviegroups#index'

end
