class ApplicationController < ActionController::Base
  include PublicActivity::StoreController
  before_action :set_locale

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def after_sign_in_path_for(resource)
    if current_user.role == Settings.role_admin
      admin_users_path
    else
      root_path
    end
  end
end
