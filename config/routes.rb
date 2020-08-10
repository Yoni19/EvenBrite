Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#index'
  resources :static_pages
  resources :events
  resources :users
  resources :attendances
  resources :sessions, only: [:new, :create, :destroy]
  get '/contact', to: 'static_pages#contact'

end
