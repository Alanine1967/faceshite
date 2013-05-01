Faceshite::Application.routes.draw do
  get "relationships/create"
  get "relationships/destroy"
  get 'contact', to: "static_pages#contact", as: 'contact'
  get 'help', to: "static_pages#help", as: 'help'
  get 'about', to: "static_pages#about", as: 'about'
  resources :missives
  resources :sessions
  resources :users
  resources :relationships
  root to: "static_pages#home"
end
