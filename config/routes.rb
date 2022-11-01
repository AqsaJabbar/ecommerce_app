Rails.application.routes.draw do
  
  devise_for :users, controllers:{
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  resources :shops 
  resources :products
 
  
  
  namespace :admin do
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