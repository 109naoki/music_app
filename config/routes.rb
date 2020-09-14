Rails.application.routes.draw do
  root 'boards#home'
  resources :boards
  resources :comments, only: %i[create destroy]
end
