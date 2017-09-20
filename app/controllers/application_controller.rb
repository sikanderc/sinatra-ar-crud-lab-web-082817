require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :'new.html'
  end

  get '/posts' do
    @posts = Post.all
    erb :'index.html'
  end

  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :'show.html'
  end

  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :'edit.html'
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update(name: params[:name], content: params[:content])
    erb :'show.html'
  end

  delete '/posts/:id/delete' do
    Post.destroy(params[:id])
    @posts = Post.all
    erb :'delete.html'
  end


end
