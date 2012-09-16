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
require 'navigation'
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
  @nav = navigate('home')
  slim :index
end

get '/home' do
  redirect '/'
end

get "/projects" do
  @nav = navigate('projects')
  static
  @title = "My projects and wips"
  @intro = :projects_intro
 
  slim :projects
end

get '/feed' do
  static archive.last.published_at.to_s
  builder :rss
end

get '/articles' do
  static
  @title = ""
  @intro = :archive_intro
  @nav = navigate('blog')
  slim :archive
end

get '/contact' do
  static
  @nav = navigate('contact')
  slim :contact
end

get '/blog' do
  static
  @title = "All articles"
  @intro = :archive_intro
  @nav = navigate('blog')
  slim :archive
end

get '/about' do
  static
  @nav = navigate('about')
  slim :about
end

get '/:article' do
  @nav = navigate('blog')
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
  @nav = navigate("not-found")
  slim :not_found
end
