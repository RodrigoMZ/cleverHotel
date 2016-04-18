Rails.application.routes.draw do

  root 'home#index'
  resources :hotels
  resources :ads

end
