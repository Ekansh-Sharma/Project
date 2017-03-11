Rails.application.routes.draw do
  root 'admin/products#index'

  namespace :admin do
    resources :products, only: [:edit, :update, :index]
  end
end
