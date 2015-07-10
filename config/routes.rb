Rails.application.routes.draw do

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'
  # resources :articles, module: 'admin'
  resources :companies, only: [:index, :new, :create, :show, :destroy] do
    get :edit, on: :collection
    patch :update, on: :collection
    resources :districts
    resources :locations
  end
    resources :evaluations do
      resources :questions
      resources :responses, only: [:new, :create]
    end

    resources :observations, only: [:new, :create] do
    end

    resource :profile
    resources :users
    # resources :users, only: [:index, :new, :create] do
    #   get :edit, on: :collection
    #   patch :update, on: :collection
    #   get :show, on: :collection
    # end

  resources :blogposts do
    resources :comments, only: [:create, :destroy]
  end

  resources :blog, only: [:index]
  resources :tour, only: [:index]
  resources :pricing, only: [:index]
  resources :about, only: [:index]

  post "/search" => "blog#search", as: :search

  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
