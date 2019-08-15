class ApplicationController < ActionController::Base
  before_action :set_locale
  def require_is_admin
    if !current_user.admin?
      flash[:alert] = '你没有管理权限 ！'
      redirect_to root_path
    end
  end

def set_locale  #設定多國語系
  if params[:locale] && I18n.available_locales.include?( params[:locale].to_sym )
  session[:locale] = params[:locale]
  end

  I18n.locale = session[:locale] || I18n.default_locale
 end

   protected

   before_action :configure_permitted_parameters, if: :devise_controller?
   before_action :configure_permitted, if: :devise_controller?

   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) do |u|
       u.permit(:name, :email, :password, :password_confirmation)
     end
    end

    def configure_permitted
     devise_parameter_sanitizer.permit(:account_update) do |u|
     u.permit(:name, :email, :password, :password_confirmation, :current_password)
   end
 end
 
end
