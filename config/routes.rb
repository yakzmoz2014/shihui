Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :meetups
  end

  resources :meetups do
    member do
      post :add_to_cart
    end
  end

  resources :carts

  root "meetups#index"

end
