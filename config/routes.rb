Rails.application.routes.draw do
  devise_for :users
  post '/create-notice', to: 'notices#create'
  get '/notifications', to: 'notices#notifications'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
