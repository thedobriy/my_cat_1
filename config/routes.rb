MyCat1::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :doctors do
    resources :comments
  end
  resources :companies
  resources :cabinets
  
  get '/companies/city/:city_id', 
    to: 'companies#sort_by_city', as: 'companies_city_sort'
  get '/doctors/city/:city_id', 
    to: 'doctors#sort_by_city', as: 'doctors_city_sort'
  get '/cabinets/city/:city_id', 
    to: 'cabinets#sort_by_city', as: 'cabinets_city_sort'
  get '/doctors/speciality/:speciality_id', 
    to: 'doctors#sort_by_speciality', as: 'doctors_speciality_sort'
  get '/doctors/city/:city_id/speciality/:speciality_id', 
    to: 'doctors#sort_by_both', as: 'doctors_both_sort'
  # resources :companies do
  #   get :sort_by_city, on: :collection
  # end
  # get 'companies/:sort_by_city', to 'companies#sort_by_city'
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/about', to: 'static_pages#about'
  get '/contacts', to: 'static_pages#contacts'
  get '/signup', to: 'users#new'
  get '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  # delete '/signout', to: 'sessions#destroy'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
