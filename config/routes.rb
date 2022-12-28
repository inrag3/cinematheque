Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  root 'pages#home'

  get 'browse' => 'pages#browse'
  get 'about' => 'pages#about'
  get 'signup' => 'users#new'
  get 'find' => 'pages#find'
  get 'content' => 'contents#show'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  #TODO пофиксить это на DELETE
  get 'logout' => 'sessions#destroy'

  resources :users
  resources :microposts,          only: [:create, :destroy]
end
