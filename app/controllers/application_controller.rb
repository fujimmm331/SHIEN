class ApplicationController < ActionController::Base
  # before_action :basic_auth 
  # ベーシック認証
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_notifications

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :team_id])
  end

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["SHIEN_USER"] && password == ENV["SHIEN_PASSWORD"]
    end
  end

  def get_notifications
    if user_signed_in?
      @notifications = Notification.where(visited_id: current_user.id).where.not(visiter_id: current_user.id).order(created_at: :desc)
      @notifications_false = @notifications.where(checked:false).count
    end
  end
end
