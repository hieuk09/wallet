# typed: strict
Rails.application.routes.draw do
  resources :exchange_rates

  resources :transactions do
    resources :sub_transactions, only: [:new, :edit, :create, :update, :destroy]
    post :ignore, on: :member
  end

  resources :categories
  resources :accounts
  resources :transfer_transactions, only: [:new, :create]

  resources :reports, only: [] do
    collection do
      get :transactions
      get :categories
      get :burn_rate
      get :runway
    end
  end

  root to: 'accounts#index'
end
