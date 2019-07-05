class Users::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :load_user

  def index
    @posts = @user.posts
    @count = @posts.count
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def edit
    if current_user.id == @user.id
      @post = @user.posts.find(params[:id])
    else
      redirect_to user_post_path
    end
  end

  def update
    if current_user.id == @user.id and @user.post.update post_attributes

    end
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def post_attributes
    params[:post].permit(:title, :kicker, :body)
  end

end