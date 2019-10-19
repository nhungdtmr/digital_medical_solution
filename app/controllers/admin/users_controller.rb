class Admin::UsersController < Admin::BaseController
  before_action :load_users, only: :destroy

  def index
    @users = User.order_by.page(params[:page]).per Settings.admin_user_page
  end

  def destroy
    if @user.is_admin?
      flash[:danger] = t ".delete_fail"
    elsif @user.destroy
      flash[:success] = t ".delete_success"
    else
      flash[:danger] = t ".delete_fail"
    end
    respond_to do |format|
      format.js
      format.html {redirect_to admin_users_path}
    end
  end

  private

  def load_users
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".no_user"
    redirect_to admin_users_path
  end
end
