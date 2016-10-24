require 'active_record'
ActiveRecord::Base.establish_connection(:adapter => :sqlite3, :database => 'tmp/db.sqlite3')

require_relative 'app/app'
require_relative 'app/api'

map '/api' do
  run API
end

map '/' do
  run App
end
