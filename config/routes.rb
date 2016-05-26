Rails.application.routes.draw do
  resources :trips
    resources :locations 
end
