require 'sinatra'
require 'haml'
require 'sinatra/flash'
require 'mail'

Mail.defaults do
  delivery_method :smtp, { :address   => "smtp.sendgrid.net",
    :port      => 587,
    :domain    => "academian.se",
    :user_name => ENV['SENDGRID_USERNAME'],
    :password  => ENV['SENDGRID_PASSWORD'],
    :authentication => 'plain',
    :enable_starttls_auto => true }
end
register Sinatra::Flash

get '/' do
  haml :index
end
post '/' do
  email = params[:email]
  name  = params[:name]
  Mail.deliver do
    to 'magnus.hoerberg@gmail.com'
    from 'contact@academian.se'
    subject 'Academian Kompis - Kontakt'
    text_part do
      body "#{name} - #{email}"
    end
  end
  flash[:success] = "Grattis, vi kommer snart kontakta dig för mer information"
  redirect back
end
