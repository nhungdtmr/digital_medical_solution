class FollowsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user, :load_post, only: %i(create destroy)

  def create
    current_user.follow(@user)
    respond_to :js
  end

  def destroy
    current_user.stop_following(@user)
    respond_to :js
  end

  private

  def load_user
    @user = User.find_by id: params[:user_id]
    return if @user
    flash[:danger] = t ".no_user"
  end

  def load_post
    @post = Post.find_by id: params[:post_id]
    return if @post
    flash[:danger] = t "no_post"
  end
end
