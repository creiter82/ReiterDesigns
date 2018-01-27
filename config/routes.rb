Rails.application.routes.draw do
  root to: 'pages#home'
  
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  resources :products
  resources :product_images, only: [:new, :create, :destroy]
end
