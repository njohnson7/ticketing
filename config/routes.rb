Rails.application.routes.draw do
  root to: 'projects#index'
  resources :projects
  resources :tickets
  resources :tags, except: :show
  resources :users, only: [:new, :create]
end
