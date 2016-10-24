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
      User.all
    end
  end
end
