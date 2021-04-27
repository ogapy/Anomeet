class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :get_notifications

  protected

  def after_sign_up_path_for(resource)
    meeting_rooms_path
  end

  def after_sign_in_path_for(resource)
    meeting_rooms_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def get_notifications
    if user_signed_in?
      @notifications = current_user.passive_notifications.where.not(sender_id: current_user.id)
      @notifications.where(is_checked: false).each do |notification|
        notification.update(is_checked: true)
      end
    end
  end
  
end
