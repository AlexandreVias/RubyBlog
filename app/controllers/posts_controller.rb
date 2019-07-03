class PostsController < ApplicationController

  def index
    @posts = Post.all.limit(5)
    @count = @posts.count
  end
end
