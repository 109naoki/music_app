Rails.application.routes.draw do
  devise_for :users, 
    controllers: { registrations: 'registrations' } 

  root 'boards#index'

  get '/users/:id', to: 'users#show', as: 'user'

  resources :boards, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)

    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end