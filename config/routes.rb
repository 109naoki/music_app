Rails.application.routes.draw do
  root 'boards#home'
  resources :boards,only: [:index, :new, :create, :show, :edit, :update]

end
