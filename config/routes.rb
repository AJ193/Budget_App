Rails.application.routes.draw do
  get '/fonts/:name.otf', to: 'fonts#show'
  resources :payments, only: [:new, :index, :create]
  resources :categories, except: [:update, :edit]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  devise_scope :user do
    authenticated :user do
      root "categories#index", as: :authenticated_root
    end
  
    unauthenticated do
      root 'home#index'
    end
  end
end
