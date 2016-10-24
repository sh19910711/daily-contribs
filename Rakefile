require 'sinatra/activerecord/rake'

namespace :db do
  task :load_config do
    ActiveRecord::Base.establish_connection(:adapter => :sqlite3, :database => 'tmp/db.sqlite3')
  end
end
