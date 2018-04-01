Rails.application.routes.draw do
  resources :exchange_rates
  resources :transactions do
    resources :sub_transactions, only: [:new, :edit, :create, :update, :destroy]
    post :ignore, on: :member
  end
  resources :categories
  resources :accounts
  root to: 'accounts#index'
end
