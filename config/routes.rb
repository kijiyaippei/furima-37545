Rails.application.routes.draw do
  devise_for :users
 root to: "items#index"
 
 resources :users do
 resources :items
 end
 resources :items do
  resources :orders
end

end