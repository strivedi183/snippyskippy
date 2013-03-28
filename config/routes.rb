Snippyskippy::Application.routes.draw do

  root :to => 'welcome#index'

  get '/test' => 'test#index'
end
