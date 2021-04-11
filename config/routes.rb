
Rails.application.routes.draw do
  resources :finances
  get '', action: :index, controller: 'orders'
  resources :cars
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, :carts, :goods, :orders
end
