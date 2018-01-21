Rails.application.routes.draw do
  devise_for :users
  resources :moviegroups
  root 'moviegroups#index'

end
