class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :load_user, only: [:create]
  before_action :load_post, only: [:create]

  def create
    comment = @post.comments.build comment_attributes
    comment.user_id = current_user.id

    comment.save

    redirect_to [current_user, @post]
  end

  def comment_attributes
    params[:comment].permit(:body)
  end

  def load_post
    @post = @user.posts.find(params[:post_id])
  end

  def load_user
    @user = User.find(params[:user_id])
  end

end
