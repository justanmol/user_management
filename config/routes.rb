Rails.application.routes.draw do
  root 'pages#home'
  get '/new', to: 'users#new'
  post '/create', to: 'users#create'
  get '/login', to: 'users#login'
  get '/success', to: 'users#success'
end
