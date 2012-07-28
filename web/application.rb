require 'sinatra'
require 'slim'
require 'compass'
require 'builder'
require 'yaml'
require 'cgi'

require 'index'
require 'index_reader'
require 'article_not_found'
require 'article'
require 'oldness'
require 'contents_storage'
require 'disqus'
require 'contents'
require 'archive'
require 'helpers'

include Helpers
ROOT = File.expand_path('../..', __FILE__)
set :root, ROOT

Compass.configuration do |config|
  config.project_path = settings.root
  config.sass_dir = 'styles'
  config.output_style = :compressed
  set :sass, Compass.sass_engine_options
end

before do
  no_www!
  no_dates!
  no_trailing_slashes!
  @description = "This is a blog of all things cool. You know. ;)"
end

get '/' do
  static
  @intro = :index_intro
  slim :index
end

get '/feed' do
  static archive.last.published_at.to_s
  builder :rss
end

get '/articles' do
  static
  @title = "All articles"
  @intro = :archive_intro
  slim :archive
end

get '/:article' do
  @article = Index.find(params[:article])
  if @article.found?
    static
    @title       = "#{@article.title} - Space, hacks and retardation"
    @description = @article.summary
    @intro       = :article_intro
    slim :article
  else
    pass
  end
end

get "/stylesheet.css" do
  static
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/application"
end

not_found do
  static "NOTFOUND"
  @intro = :not_found_intro
  slim :not_found
end
