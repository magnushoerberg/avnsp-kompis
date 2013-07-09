require 'bundler/setup'
require './app'

map '/' do
  use Rack::Static, {
    :root => "public",
    :urls => ["/images", "/fonts", "/favicon.ico", "/robots.txt", "/assets"],
    :cache_control => "public,max-age=#{365 * 24 * 3600}"
  }

  use Rack::Session::Cookie, :secret => 'secret', :expire_after =>  24 * 3600                                                                  

  run Sinatra::Application
end
