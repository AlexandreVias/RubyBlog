class Users::PostsController < ApplicationController
  before_action :load_user

  def index
    @posts = @user.posts
    @count = @posts.count
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end