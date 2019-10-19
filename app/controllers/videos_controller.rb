class VideosController < ApplicationController
  before_action :load_video, only: %i(show edit update destroy)

  def index
    @videos = Video.order_by.page(params[:page]).per Settings.video_pages
  end
  def new
    @video = Video.new
  end

  def create
    @video = Video.new video_params
    if @video.save
      flash[:success] = t ".create_success"
      redirect_to @video
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @video.update video_params
      flash[:success] = t ".update_success"
      redirect_to @video
    else
      flash[:danger] = t ".update_fail"
      render :edit
    end
  end

  def destroy
    if @video.destroy
      flash[:success] = t ".delete_success"
      redirect_to videos_path
    else
      flash[:danger] = t ".delete_fail"
    end
  end

  private

  def video_params
    params.require(:video).permit :name, :video_url, :user_id
  end

  def load_video
    @video = Video.find_by id: params[:id]
    return if @video
    flash[:danger] = t ".no_video"
    redirect_to videos_path
  end
end
