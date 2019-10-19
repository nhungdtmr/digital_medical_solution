class Admin::PostsController < Admin::BaseController
  before_action :load_posts, only: :destroy

  def index
    @posts = Post.order_by.page(params[:page]).per Settings.admin_user_page
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    respond_to do |format|
      format.js
      format.html {redirect_to admin_posts_path}
    end
  end

  private

  def load_posts
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".no_user"
    redirect_to admin_posts_path
  end
end
