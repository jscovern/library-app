Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "users#index"

  get '/users', to: "users#index", as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show'
  get '/sign_in', to: 'sessions#new'
  post '/sessions', to: 'sessions#create'
  delete '/sessions/:id', to: 'sessions#destroy', as: 'destroy_session'
  get '/libraries', to: "libraries#index"
  get '/libraries/new', to: "libraries#new", as: 'new_library'
  post '/libraries', to: 'libraries#create'
  get '/libraries/:id', to: 'libraries#show'
  get '/libraries/:id/edit', to: 'libraries#edit'
  patch '/libraries/:id/edit', to: 'libraries#update'
  delete '/libraries/:id', to: 'libraries#destroy'
  get '/users/:user_id/libraries', to: 'library_users#index', as: 'user_libraries'
  post '/libraries/:library_id/users', to: 'library_users#create', as: 'library_users'
end
