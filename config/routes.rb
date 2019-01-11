# frozen_string_literal: true

require_relative './routes/json_constraint'

Rails.application.routes.draw do
  namespace :complaints, constraints: Routes::JSONConstraint do
    namespace :v1 do
      get :fetch_all, to: 'fetch_all#call', path: 'fetch-all'
      post :create, to: 'create#call'
    end

    get '/', to: 'v1/fetch_all#call'
    post '/', to: 'v1/create#call'
  end

  root to: 'errors/v1/not_found#call', via: :all

  match '*unmatched', to: 'errors/v1/not_found#call', via: :all
end
