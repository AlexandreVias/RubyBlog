class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    @posts = Post.all.limit(5)
    @count = @posts.count
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build post_attributes
    if @post.save
      redirect_to [current_user, @post]
    else
      render :new
    end
  end

  def post_attributes
    params[:post].permit(:title, :kicker, :body)
  end
end
