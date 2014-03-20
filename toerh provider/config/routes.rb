require 'api_constraints'

TOERH::Application.routes.draw do

  use_doorkeeper

  namespace :api, defaults: {format: 'json'}, :provides => [:json, :xml] do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      match 'user', to: 'users#show', via: :get, as: 'user'
    end
  end

  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions

  # get 'register', to: 'api_keys#register'
  # get 'account', to: 'api_keys#account', as: 'account'
  # post 'register', to: 'api_keys#create', as: 'api_keys'
  # get 'login', to: 'api_keys#login'
  # post 'login', to: 'api_keys#post_login', as: 'post_login'
  # get 'logout', to: 'api_keys#logout', as: 'logout'

  # get 'admin-login', to: 'apps#login', as: 'admin_login'
  # post 'admin-login', to: 'apps#post_login', as: 'admin_post_login'
  # get 'admin-logout', to: 'apps#logout', as: 'admin_logout'
  # resources :apps
  # patch 'apps/:id/edit', to: 'apps#update', as: 'api_key'



  #match 'auth/:provider/callback', to: 'resources#test', via: :all

  #match '*rest', to: 'application#notfound', via: :all
  

  #get 'resources' => 'resource#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  #root 'welcome#index'

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
