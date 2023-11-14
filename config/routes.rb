Rails.application.routes.draw do
  namespace :users do
    resources :users
    resources :products, only: [:show, :index]
    resources :categories
    resources :likes
    resources :account_activations, only: [:edit]
    resources :password_resets
    resources :info_orders

    resources :carts do
      collection do
        post :input_quantity
        post :change_quantity
      end
    end

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/signup', to: 'users#new'
    get '/search', to: 'searchs#search'
    get '/order_history_detail', to: 'info_orders#order_history_detail'
    post '/filter_price', to: 'categories#filter_price'
    root "products#index"
  end

  namespace :shops do
    resources :shops
    resources :categories
    resources :products
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/order_history_list_shop', to: 'info_orders#order_history_list_shop'
    get '/order_history_detail', to: 'info_orders#order_history_detail'
    root "products#index"
  end

  # match '*path', via: :all, to: 'application#error_not_found', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
  root "users/products#index"
end
