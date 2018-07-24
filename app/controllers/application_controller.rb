
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
end
