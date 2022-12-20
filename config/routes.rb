Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :cart_items
  resources :carts
  resources :orders
  resources :order_items do
    collection do
      get :copy
    end
  end
  namespace :admin do
    resources :users
  resources :categories do
    member do
      get :sub
    end
  end
  resources :sub_categories
  resources :shops 
  resources :products
  
end
   root 'home#index'

end