Rails.application.routes.draw do
  root 'boards#home'
  get '/boards', to: 'boards#index'

end
