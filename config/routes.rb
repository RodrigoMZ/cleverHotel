Rails.application.routes.draw do

  root 'hotels#index'
  resources :hotels do
    collection { post :import }
  end
  resources :ads

  get "/api/hotels/" => "api/hotels#index"
  post "/api/hotels/new" => "api/hotels#create"

end
