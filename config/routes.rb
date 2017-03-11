Rails.application.routes.draw do
  root 'admin/products#index'

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      post 'products' => 'products#create'
    end
  end

  namespace :admin do
    resources :products, only: [:edit, :update, :index]
  end
end
