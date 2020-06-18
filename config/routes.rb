Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'

  resources :users
  get '/signup', to: 'users#new'

  get '/login', to: 'serssions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
