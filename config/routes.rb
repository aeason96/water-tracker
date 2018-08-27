Rails.application.routes.draw do
  get '/hello-world' => 'application#hello_world'
  resources :drinks
  resources :containers
  resources :users
  post '/login' => 'users#login'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
