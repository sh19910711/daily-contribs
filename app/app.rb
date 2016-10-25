require 'sinatra/base'
require 'warden'
require 'warden/github'

class App < Sinatra::Base
  include Warden::GitHub::SSO
  use Rack::Session::Cookie, secret: ENV['SESSION_SECRET']
  use Warden::Manager do |config|
    config.failure_app = App
    config.default_strategies :github
    config.scope_defaults :default, :config => {
      :client_id => ENV['GITHUB_CLIENT_ID'],
      :client_secret => ENV['GITHUB_CLIENT_SECRET'],
    }
    config.serialize_from_session { |key| Warden::GitHub::Verifier.load(key) }
    config.serialize_into_session { |user| Warden::GitHub::Verifier.dump(user) }
  end

  get '/' do
    slim :index
  end

  get '/login' do
    verify_session
    env['warden'].authenticate!
    u = User.find_or_create_by(name: github_user.login)
    u.update_attributes(token: github_user.token)
    redirect '/'
  end

  get '/logout' do
    env['warden'].logout
    redirect '/'
  end

  private

    def github_user
      env['warden'].user
    end

    def verify_session
      if github_user && !warden_github_sso_session_valid?(env['warden'].user, 10)
        env['warden'].logout
      end
    end
end
