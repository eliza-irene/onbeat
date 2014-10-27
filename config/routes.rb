Rails.application.routes.draw do

root  'static_pages#home'

match '/signup',  to: 'users#new',        via: 'get'
match '/signin', to: 'sessions#new',      via: 'get'
match '/signout', to: 'sessions#destroy', via: 'delete'

resources :users, only: [:create, :show]
resources :sessions, only: [:create, :destroy]

end
