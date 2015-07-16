Rails.application.routes.draw do

  root 'welcome#index'

  resources :companies, only: [:index, :new, :create, :show, :destroy] do
    get :edit, on: :collection
    patch :update, on: :collection
    resources :districts
    resources :locations
    resources :invitations, only: [:new, :create]
  end

  resources :evaluations do
    resources :questions
    resources :responses, only: [:new, :create]
  end

  resources :observations, only: [:new, :create, :show] do
  end

  resource :profile
  resources :users, except: [:index]
  get   "users/new/:token" => "users#new", as: :signup

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

end
