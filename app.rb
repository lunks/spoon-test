require 'bundler'
Bundler.require(:default)

class App < Sinatra::Base
  get '/' do
    'Hello world!'
  end
end
