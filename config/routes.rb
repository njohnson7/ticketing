Rails.application.routes.draw do
  root to: 'projects#index'

  resources :projects

  resources :tickets do
    resources :comments, only: [:create, :edit, :update, :destroy]
  end

  resources :tags, except: :show

  resources :users, only: :create
  get 'signup', to: 'users#new'

  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
