Rails.application.routes.draw do
  
  resources :communities, except: [:destroy, :edit, :update ]
  resources :whistles, except: [:destroy, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  root "static#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
