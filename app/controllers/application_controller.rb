class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  after_action :track

  def self.default_url_options(options={})
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(user)
    if user.is_admin?
      admin_dashboard_path
    else
      stored_location_for(:user) || root_path
    end
  end

  protected

  #ADDITIONAL_AHOY_FILTERS = [ :blank_file, :signature, :wet_signature, :file, :image, :logo, :picture ]
  #AHOY_PARAM_FILTER       = ActionDispatch::Http::ParameterFilter.new(ADDITIONAL_AHOY_FILTERS)

  def track
    #ahoy_params = AHOY_PARAM_FILTER.filter(request.filtered_parameters)
    #ahoy.track "Processed #{controller_name}##{action_name}", ahoy_params
  end
  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :description, :email_confirmation])
  end

  def user_can_edit?(object)
    unless current_user.can_edit? object
      redirect_to root_path, alert: 'Only authorised users can edit events!'
    end
  end

end
