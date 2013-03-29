Snippyskippy::Application.routes.draw do

  root :to => 'welcome#index'

  get '/test' => 'test#index'

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'

end
