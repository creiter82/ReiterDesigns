Rails.application.routes.draw do
  root to: 'pages#home'

  resources :products
  resources :product_images, only: [:new, :create, :destroy]
end
