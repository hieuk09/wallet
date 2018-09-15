Rails.application.routes.draw do
  resources :exchange_rates

  resources :transactions do
    resources :sub_transactions, only: [:new, :edit, :create, :update, :destroy]
    post :ignore, on: :member
  end

  resources :categories
  resources :accounts
  resources :exports, only: [:new, :create]
  resources :transfer_transactions, only: [:new, :create]

  resources :reports, only: [] do
    get :transactions, on: :collection
    get :categories, on: :collection
    get :burn_rate, on: :collection
  end

  root to: 'accounts#index'
end
