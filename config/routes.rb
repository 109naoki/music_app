Rails.application.routes.draw do

  root 'boards#home'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

   devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
    get 'boards',to: "boards#index"
    post 'follow/:id' => 'relationships#follow', as: 'follow'
    post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'
    get '/users/:id', to: 'users#show', as: 'user'

    resources :boards, only: %i(new create index show destroy) do
    resources :photos, only: %i(create)

    resources :likes, only: %i(create destroy)
    resources :comments, only: %i(create destroy)
  end
end
