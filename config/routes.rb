Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root :to => "home#index"

  resources :entities
  resources :sales
  resources :payments
  resources :purchases

end
