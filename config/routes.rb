Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/sign_in', to: 'session#create'
      resources :admin_users, only: [:create]
      resources :dealers, only: [:create]
      resources :bikes, only: %i[index create]
      resources :bike_leases, only: [:create]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
