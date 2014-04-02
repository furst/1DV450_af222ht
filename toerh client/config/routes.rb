require 'api_constraints'

TOERH::Application.routes.draw do

  match '/*path' => 'sessions#home', :via => :options

  get '', to: 'sessions#home'
  
  match '/auth/:provider/callback', to: 'sessions#create', via: :all
  get '/authenticate' => 'sessions#authenticate'

  namespace :api, defaults: {format: 'json'}, :provides => [:json, :xml] do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :resources
      resources :users
      resources :tags
      resources :types
      resources :licenses

      get 'tags/:id/resources', to: 'tags#resources', as: 'rtag'
      get 'types/:id/resources', to: 'types#resources', as: 'rresourcetype'
      get 'licenses/:id/resources', to: 'licenses#resources', as: 'rlicense'
      get 'users/:id/resources', to: 'users#resources', as: 'ruser'
    end

    match '*rest', to: 'base#notfound', via: :all
  end

  namespace :dev do

    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      get '', to: 'apiusers#login'

      get 'register', to: 'apiusers#register'
      get 'account', to: 'apiusers#account', as: 'account'
      post 'register', to: 'apiusers#create', as: 'apiusers'
      get 'login', to: 'apiusers#login'
      post 'login', to: 'apiusers#post_login', as: 'post_login'
      get 'logout', to: 'apiusers#logout', as: 'logout'

      get 'users', to: 'apiusers#users', as: 'userslist'
      get 'users/:id/edit', to: 'apiusers#edit', as: 'edit_user'
      patch 'users/:id/edit', to: 'apiusers#update', as: 'update_user'
      delete 'users/:id/delete', to: 'apiusers#destroy', as: 'delete_user'

      get 'docs' => 'docs#index'
      get 'docs/getting-started' => 'docs#index', as: 'start'
      get 'docs/resources' => 'docs#resources', as: 'resources'
      get 'docs/users' => 'docs#users', as: 'users'
      get 'docs/tags' => 'docs#tags', as: 'tags'
      get 'docs/licenses' => 'docs#licenses', as: 'licenses'
      get 'docs/resource-types' => 'docs#resourcetypes', as: 'resourcetypes'
      get 'docs/errors' => 'docs#errors', as: 'errors'
    end
  end

  match '*rest', to: 'application#notfound', via: :all

end
