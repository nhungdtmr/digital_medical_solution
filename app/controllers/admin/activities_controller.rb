class Admin::ActivitiesController < Admin::BaseController
  def index
    @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per Settings.admin_activity_page
  end
end
