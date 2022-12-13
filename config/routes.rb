Rails.application.routes.draw do
  get 'users/new'
  root 'pages#home'

  get 'browse' => 'pages#browse'
  get 'about' => 'pages#about'
  get 'signup' => 'users#new'

  resources :users
end
