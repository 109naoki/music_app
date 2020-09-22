Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'registrations' } 

  root 'boards#index'

  get '/users/:id', to: 'users#show', as: 'user'
  resources :boards, only: %i(new create index) do
    resources :photos, only: %i(create)
  end
end