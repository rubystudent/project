Rails.application.routes.draw do
  root 'sessions#new'

  get 'login', to: 'sessions#new'
  get 'create', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
end
