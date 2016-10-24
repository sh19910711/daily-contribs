require 'octokit'
require 'active_record'
ActiveRecord::Base.establish_connection(:adapter => :sqlite3, :database => 'tmp/db.sqlite3')
require_relative '../app/models'

class Client
  attr_reader :client

  def initialize(token)
    @client = Octokit::Client.new(access_token: token)
  end

  def commits(user)
    client.user_events(user.name).map do |e|
      if e.type == 'PushEvent'
        e.payload.commits.map do |c|
          { sha: c.sha, message: c.message, repo_id: e.repo.id, date: e.created_at }
        end
      else
        []
      end
    end.flatten
  end
end

User.all.each do |u|
  puts "find new commits of #{u.name}"
  Client.new(ENV['GITHUB_TOKEN']).commits(u).each do |c|
    unless u.commits.where(sha: c[:sha]).exists?
      u.commits.create(sha: c[:sha], repo_id: c[:repo_id], message: c[:message], date: c[:date])
    end
  end
end
