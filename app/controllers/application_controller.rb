class ApplicationController < ActionController::Base
#before_action :authenticate_user!

  before_action :configure_permitted_parameters, if: :devise_controller?
  

    def after_sign_in_path_for(resource) #ログイン後のパス
    	user_path(current_user.id)
  	end

  	def after_sign_out_path_for(resource) #ログアウト後のパス
    	new_user_path
  	end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end


end
