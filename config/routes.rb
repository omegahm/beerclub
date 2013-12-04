Beerclub::Application.routes.draw do
  resources :meta

  resources :users
  resources :products

  get 'accounts' => 'accounts#index'
  patch 'accounts' => 'accounts#update', as: :update_accounts

  resources :administrators, :administrator_sessions
  get 'login' => 'administrator_sessions#new'
  get 'logout' => 'administrator_sessions#destroy'

  get 'print' => 'home#account', constraints: { format: :pdf }
  get 'graph/:id' => 'home#graph', as: :graph

  get 'error' => 'administrators#error'

  root 'home#index'
end
