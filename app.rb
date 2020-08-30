require 'bundler'
Bundler.require(:default)

require './recipe'

class App < Sinatra::Base
  register Sinatra::Glorify
  get '/' do
    @recipes = Recipe.all
    erb :index, layout: :main
  end

  get '/:id' do
    @recipe = Recipe.new(params[:id])
    erb :show, layout: :main
  end
end
