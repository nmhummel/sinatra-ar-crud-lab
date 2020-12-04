require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  # The Read CRUD action corresponds to two different controller actions: show and index. 
  # The show action should render the ERB view show.erb, which shows an individual article. 
  # The index action should render the ERB view index.erb, which shows a list of all of the articles.

  # INDEX
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  # NEW ARTICLE
  get '/articles/new' do
    @article = Article.new
    erb :new
  end

  # CREATE NEW ARTICLE
  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  # SHOW ONE ARTICLE
  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # EDIT AN ARTICLE
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  # UPDATE ARTICLE
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{@article.id}"
  end

  # DESTROY ARTICLE
  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect to "/articles"
  end
  
  get '/edit' do
    "Hello World"
  end
  
end