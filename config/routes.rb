Rails.application.routes.draw do
  devise_for :users
  resources :dashboard, only: :index
  root 'dashboard#index'
end
