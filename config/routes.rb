Rails.application.routes.draw do
  namespace :users do
    resources :users
    resources :products, only: [:show, :index]

    resources :likes
    resources :account_activations, only: [:edit]
    resources :password_resets
    resources :password_changes, only: [:edit, :update]

    resources :categories do
      collection do
        post :filter_price
      end
    end

    resources :info_orders do
      collection do
        get :order_history_detail
      end
    end

    resources :carts do
      collection do
        post :change_quantity
      end
    end

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/signup', to: 'users#new'

    get '/search', to: 'searchs#search'
    root "products#index"
  end

  namespace :shops do
    resources :shops
    resources :categories
    resources :products
    resources :password_changes, only: [:edit, :update]

    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    get '/order_history_list_shop', to: 'info_orders#order_history_list_shop'
    get '/order_history_detail', to: 'info_orders#order_history_detail'

    root "products#index"
  end

<<<<<<< HEAD
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  match '*path', via: :all, to: 'application#error_not_found', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
=======
  # match '*path', via: :all, to: 'application#error_not_found', constraints: lambda { |req| req.path.exclude? 'rails/active_storage' }
>>>>>>> main
  root "users/products#index"
end
