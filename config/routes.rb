Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/home',to:'home#index'

  namespace :admin do
    resources :users
  end

  root to: 'home#index'
  resources :tasks
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
