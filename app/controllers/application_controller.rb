class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect '/recipes/#{@recipe.id}'
  end

  get '/recipe/:id'
   @recipe = Recipe.find_by_id(params[:id])
   erb :show
 end

end
