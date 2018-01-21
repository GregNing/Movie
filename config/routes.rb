Rails.application.routes.draw do
  devise_for :users
  resources :moviegroups do
    resources :reviews
  end
  root 'moviegroups#index'

end
