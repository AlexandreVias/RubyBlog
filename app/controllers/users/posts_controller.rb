class Users::PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :load_user
  before_action :load_post, only: [:update, :destroy]

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
    if current_user.id == @user.id and @post.update post_attributes
      redirect_to user_post_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @user.id
      @post.destroy
    end
    redirect_to user_posts_path
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def load_post
    @post = @user.posts.find(params[:id])
  end

  def post_attributes
    params[:post].permit(:title, :kicker, :body)
  end

end
