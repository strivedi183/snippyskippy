Snippyskippy::Application.routes.draw do

  root :to => 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :media, :only => [:index, :new, :create, :show]
  resources :clients, :only => [:show, :new, :create]
  resources :stylists
  resources :users, :only => [:new, :create]

  get 'gallery_dev' => 'welcome#gallery_dev'

  resources :m, :only => [:index]
end
