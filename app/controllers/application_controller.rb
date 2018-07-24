
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

# load new form
  get '/posts/new' do
    erb :new
  end

# creates a post from form submittion and adds to table
  get '/posts' do
    @post = Post.create(params)
    redirect to '/posts'
  end

# create @posts variable containing all the osts to pass to view
# loads index page which iterates through @posts to display all the blog posts
  get '/posts' do
    @posts = Post.all
    erb :index
  end

# creates @posts variable to pass post matching id to view
# loads show page and displays the post
  get '/posts/id' do
    @posts = Post.find_by_id(params[:id])
    erb :show
  end

end
