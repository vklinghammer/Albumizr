Albumizr::Application.routes.draw do
  resources :albums

  resources :sessions, only: [:new, :create, :destroy]
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  resources :users, only: [:new, :create]
  match '/signup'  => 'users#new', as: 'signup'

  root :to => "albums#index"
end