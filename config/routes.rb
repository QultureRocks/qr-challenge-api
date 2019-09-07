# frozen_string_literal: true

Rails.application.routes.draw do
  post '/graphql', to: 'graphql#execute'
  apipie
  get '/' => redirect('/apipie')
  namespace :api do
    namespace :v1 do
      resources :users do
        resources :comments, only: [:index]
      end

      resources :comments, except: [:index]
    end
  end
end
