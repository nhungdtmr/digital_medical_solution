class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_comment, only: [:destroy]

  def create
    if params[:comment][:parent_id].to_i > 0
      parent = Comment.find_by id: params[:comment].delete(:parent_id)
      @comment = parent.children.build comment_params
    else
      @comment = Comment.new comment_params
    end
    if @comment.save
      respond_to do |format|
        format.html{redirect_back fallback_location: root_path}
        format.js
      end
    end
  end

  def destroy
    @comment.descendants.each do |comment_des|
      comment_des.destroy
    end
    @comment.destroy
    respond_to do |format|
      format.html{redirect_to post_path(@comment.id)}
      format.js
    end
  end

  private

  def comment_params
    params.require(:comment).permit :content, :user_id, :post_id
  end

  def load_comment
    @comment = Comment.find_by id: params[:post_id]
  end
end
