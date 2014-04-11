class Api::V1::PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all
    render json: @posts
  end

  def create
    @post = Post.create(params[:post])
    render json: @post
  end

  def show
    @post = Post.find(params[:id])
    render json: @post
  end

  def update
    @post = Post.find(params[:id])
    @post.update_attributes(params[:post])
    render json: @post
  end
end