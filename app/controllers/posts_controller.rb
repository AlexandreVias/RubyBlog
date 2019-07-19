class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def index
    posts = Post.all.order('updated_at DESC')
    @count = posts.count
    @posts = posts.page(params[:page]).per(6)
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
    params[:post].permit(:title, :kicker, :body, :img)
  end
end
