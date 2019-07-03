class UsersController < ApplicationController
  before_action :load_user, only: %i[show]

  def load_user
    @user = User.find(params[:id])
  end

end
