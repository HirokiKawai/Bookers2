class ApplicationController < ActionController::Base


  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
    user_path(current_user)
  end


  def after_sign_out_path_for(resource)
    root_path
  end


  # 呼び出された他のコントローラからも参照ができるストロングパラメータ。
  # 注意として、privateは自分のコントローラ内でしか参照できない。
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end

end
