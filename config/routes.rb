Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get "users/show" => "users#show"
 
  root 'boards#home'
  resources :boards
  resources :comments, only: %i[create destroy]
  if Rails.env.development?  
    mount LetterOpenerWeb::Engine, at: "/letter_opener"  
  end
end
