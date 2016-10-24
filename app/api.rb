require 'grape'
require_relative 'models'

class API < Grape::API
  version 'v0', :using => :header, :vendor => 'daily-contribs'
  format :json

  get '/hello' do
    { msg: 'hello world' }
  end

  resources :users do
    get do
      User.select(:id, :name, :github_id).all
    end

    route_param :name do
      get :commits do
        User.select(:id, :name, :commits).find_by(name: params[:name])
      end
    end
  end
end
