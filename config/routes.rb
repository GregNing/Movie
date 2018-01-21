Rails.application.routes.draw do
  resources :moviegroups
  root 'moviegroups#index'

end
