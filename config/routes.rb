Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'stories#index'

  resources :stories do 
  	get "images"
    post "favorite"
    post "unfavorite"
  end
 
  resources :segments do
  	post "up"
  	post "down"
  end
  resources :sentences
end

