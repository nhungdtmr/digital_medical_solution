class PostsController < ApplicationController
  before_action :load_categories, only: %i(new create edit index show)
  before_action :load_post, only: %i(show edit update destroy)

  def index
    @posts = Post.order_by.page(params[:page]).per Settings.post_page
    if params[:category]
      @category = params[:category]
      @posts = Post.order_by.filter_post_by_type(params[:category]).page(params[:page]).per Settings.post_page
    end
    respond_to do |format|
      format.html
      format.js {render :index}
    end    
  end

  def show
    @relative_posts = Post.order_by_relative_category(@post.category_id).limit Settings.recent_post
    @comment = Comment.new
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params
    if @post.save
      flash[:success] = t ".create_sucsess"
      redirect_to posts_path
    else
      flash[:danger] = t ".create_fail"
      render :new
    end
  end

  def edit; end

  def update
    if @post.update post_params
      flash[:success] = t ".update_sucess"
      redirect_to posts_path
    else
      flash[:danger] = t ".create_fail"
      render :edit
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t ".delete_success"
      redirect_to posts_path
    else
      flash[:danger] = t ".delete_fail"
    end
  end

  private

  def post_params
    params.require(:post).permit :title, :content, :thumbnail, :user_id, :category_id
  end

  def load_categories
    @categories = Category.select_categories
  end

  def load_post
    @post = Post.find_by id: params[:id]
    return if @post
    flash[:danger] = t ".no_post"
    redirect_to posts_path
  end
end
