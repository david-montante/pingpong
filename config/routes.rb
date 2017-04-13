Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  get '/history', to: 'home#history'
  get '/log',     to: 'home#log'
  get '/users',   to: 'home#users', :defaults => { :format => 'json' }
  get '/games',   to: 'home#games', :defaults => { :format => 'json' }
  get '/setGame', to: 'home#setGame', :defaults => { :format => 'json' }
end
