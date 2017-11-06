Rails.application.routes.draw do

  devise_for :users

  root 'welcome#index'
  
  # Autenthicate principal
  get 'login/index'

  # Custom resources
  namespace :admin do
    resources :welcome, only: [:index]
    resources :cat_labels
    resources :cat_places
    resources :places
  end
end
