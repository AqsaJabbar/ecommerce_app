Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :cart_items
  resources :carts
  namespace :admin do
    resources :users, :only => [:index,:show]
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