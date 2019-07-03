class Users::PostsController < ApplicationController
  before_action :load_user

  def index
    @posts = @user.posts
    @count = @posts.count
  end

  def load_user
    @user = User.find(params[:id])
  end
end