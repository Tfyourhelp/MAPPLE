Rails.application.routes.draw do
  #get 'checkouts/success'
  resources :products
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets
  resources :shops
  resources :categories
  resources :carts 
  resources :info_orders
  resources :checkouts, only: [:create]

  get '/success', to: 'checkouts#success'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  delete '/logout', to: 'sessions#destroy'
  root  "products#index"  #  static_pages#home
  post '/change_quantity', to: 'carts#change_quantity'
  post '/input_quantity', to: 'carts#input_quantity'
  get '/order_history_detail', to: 'info_orders#order_history_detail'
  get '/order_history_list_shop', to: 'info_orders#order_history_list_shop'
  post '/filter_price', to: 'categories#filter_price'

  post '/search_in_product_page', to: 'products#search_in_product_page'
  
  get '/search', to: 'searchs#search'
end
