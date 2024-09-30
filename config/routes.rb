Rails.application.routes.draw do
  resources :meetings do
    resources :comments
  end
  get 'active-sessions', to: "meetings#active_sessions"
  # root to: 'static_pages#index'
  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  devise_for :users
  root to: 'home#index'
  resources :users, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
