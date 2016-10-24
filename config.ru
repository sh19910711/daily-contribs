require_relative 'app/app'
require_relative 'app/api'

map '/api' do
  run API
end

map '/' do
  run App
end
