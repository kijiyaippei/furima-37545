Rails.application.routes.draw do
  devise_for :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 

 root to: "items#index"
 
 resources :users do
 resources :items
 end

resources :items do
resources :orders
end
end

