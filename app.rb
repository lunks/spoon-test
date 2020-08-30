require 'bundler'
Bundler.require(:default)

require './recipe'

class App < Sinatra::Base
  get '/' do
    @recipes = Recipe.all
    erb :index, layout: :main
  end

  get '/:id' do
    @recipe = Recipe.new(params[:id])
    erb :show, layout: :main
  end
end
