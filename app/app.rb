require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    slim :index
  end
end
