Snippyskippy::Application.routes.draw do

  root :to => 'welcome#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

  resources :media, :only => [:index, :new, :create, :show]
  resources :clients, :only => [:show, :new, :create] do
    member do
      post 'update_rank'
      post 'clear_ranks'
      post 'update_favorites'
    end
  end
  resources :stylists
  resources :users, :only => [:new, :create]
  resources :salons, :only => [:new, :create]

  get 'gallery_dev' => 'welcome#gallery_dev'

  resources :m, :only => [:index, :create, :new]


  get '/m_login' => 'session#m_new'
  post '/m_login' => 'session#m_create'

end
