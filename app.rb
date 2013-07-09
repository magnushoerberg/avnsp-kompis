require 'bundler/setup'
require 'sinatra'
require 'sequel'
require 'haml'

get '/' do
  haml :index
end
