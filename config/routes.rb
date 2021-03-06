Rails.application.routes.draw do

  resources :histories
  resources :tour_bookings
  resources :places
  resources :employees
  resources :tour_details
  resources :tours
  resources :user_tours
  root "static_pages#home"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/contact", to: "static_pages#contact"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :users
  resources :account_activations, only: :edit
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]

  namespace :admin do
   root "admins#index"
   resources :tours
   resources :places
   resources :users, only: [:index, :create, :destroy]
   resources :employees
   resources :tour_bookings
   resources :tour_details
 end

end
