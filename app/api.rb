require 'grape'

class API < Grape::API
  version 'v0', :using => :header, :vendor => 'daily-contribs'
  format :json

  get '/hello' do
    { msg: 'hello world' }
  end
end
