Rails.application.routes.draw do
  resources :transactions
  resources :categories
  resources :accounts
  root to: 'accounts#index'
end
