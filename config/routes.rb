# frozen_string_literal: true

Rails.application.routes.draw do
  apipie
  get '/' => redirect('/apipie')

  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: 'graphql'
  post '/graphql', to: 'graphql#execute'

  namespace :api do
    namespace :v1 do
      resources :users do
        resources :comments, only: [:index]
      end

      resources :comments, except: [:index]
    end
  end
end
