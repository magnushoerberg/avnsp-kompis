require 'bundler/setup'

map '/' do
  use Rack::Static, {
    :root => "public",
    :urls => ["/images", "/fonts", "/favicon.ico", "/robots.txt", "/assets"],
    :cache_control => "public,max-age=#{365 * 24 * 3600}"
  }
end
