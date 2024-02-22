Rails.application.routes.draw do
  root to: 'films#index'

  resources :comments, only: %i[new create]
  resource :session, only: %i[new create destroy]
  resources :users, only: %i[new create edit update]
  resources :films, only: %i[new create show index]
  resources :contacts, only: %i[index]
end
