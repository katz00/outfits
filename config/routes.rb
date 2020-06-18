Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  get 'users/show'
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  
end
