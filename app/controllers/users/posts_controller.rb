class Users::PostsController < ApplicationController
  before_action :load_user

  def index
    @posts = @user.posts
    @count = @posts.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = @user.posts.build post_attributes
    if @post.save
      redirect_to [@user, @post]
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def load_user
    @user = User.find(params[:user_id])
  end

  def post_attributes
    attributes = params[:post].permit(:title, :kicker, :body)
  end
end