Rails.application.routes.draw do
  root 'pages#home'

  get '/browse', to: 'pages#browse'
end
