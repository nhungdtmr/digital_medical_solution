class Admin::VideosController < Admin::BaseController
  before_action :load_videos, only: :destroy
  
  def index
    @videos = Video.order_by.page(params[:page]).per Settings.admin_user_page
  end

  def destroy
    if @video.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    respond_to do |format|
      format.js
      format.html {redirect_to admin_videos_path}
    end
  end

  private

  def load_videos
    @video = Video.find_by id: params[:id]
    return if @video
    flash[:danger] = t ".no_video"
    redirect_to admin_videos_path
  end
end
