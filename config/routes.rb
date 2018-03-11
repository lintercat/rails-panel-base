Rails.application.routes.draw do
  resources :dashboard, only: :index
  root 'dashboard#index'
end
