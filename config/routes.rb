Faceshite::Application.routes.draw do
  get "relationship/create"
  get "relationship/destroy"
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'contact', to: "static_pages#contact", as: 'contact'
  get 'help', to: "static_pages#help", as: 'help'
  get 'about', to: "static_pages#about", as: 'about'
  resources :missives
  resources :sessions
  resources :users
  root to: "static_pages#home"
end
