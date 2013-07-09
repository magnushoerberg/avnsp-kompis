require 'sinatra'
require 'haml'
require 'sinatra/flash'

register Sinatra::Flash

get '/' do
  haml :index
end
post '/' do
  email = params[:email]
  name  = params[:name]
  flash[:success] = "Grattis, vi kommer snart kontakta dig för mer information"
  redirect back
end
