Faceshite::Application.routes.draw do

  resource :session, only: [:new, :create, :destroy]

  resources :users, shallow: true do
  	resources :missives
  end

  resources :relationships, only: [:index, :create, :destroy]

  controller :static_pages do
  	get 'contact' => :contact
  	get 'help' => :help
  	get 'about' => :about
  end

  root "static_pages#home"
end
