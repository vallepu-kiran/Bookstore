Rails.application.routes.draw do
  get 'book/Orders'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  
   root "authors#index" 
   resources :authors
   resources :book_orders
   resources :customers
   resources :books
   resources :orders
   resources :reviews
   resources :suppliers
   resources :books do
   resources :reviews, only: [:new, :create]
   end
   
  end
  
  
   
 