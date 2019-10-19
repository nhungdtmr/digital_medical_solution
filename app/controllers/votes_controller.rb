class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :load_post, only: %i(create destroy)

  def create
    @post.liked_by current_user
    respond_to do |format|
      format.html {redirect_to @post}
      format.js {render :vote}
    end
  end

  def destroy
    @post.disliked_by current_user
    respond_to do |format|
      format.html {redirect_to @post}
      format.js {render :vote}
    end
  end

  private

  def load_post
    @post = Post.find_by id: params[:post_id]
    return if @post
    flash[:success] = t ".no_post"
    redirect_to posts_path
  end
end
