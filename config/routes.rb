Beerclub::Application.routes.draw do
  resources :meta

  resources :users
  resources :products

  get 'accounts' => 'accounts#index'
  patch 'accounts' => 'accounts#update', as: :update_accounts

  resources :administrators, :administrator_sessions
  get 'login' => 'administrator_sessions#new', as: :login
  get 'logout' => 'administrator_sessions#destroy', as: :logout

  get 'print' => 'home#account', constraints: {format: :pdf}, as: :print
  get 'graph/:id' => 'home#graph', as: :graph

  root 'home#index'
end
