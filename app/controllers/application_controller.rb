class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include DeviseWhitelist

  protected  
    def after_sign_in_path_for(resource)
      sign_in_url = new_user_session_url
      sign_up_url = new_user_registration_url
      if request.referer == sign_in_url || request.referer == sign_up_url
        super
      else
        stored_location_for(resource) || request.referer || root_path
      end
    end

  #
  # def stored_location_for(resource)
  #   nil
  # end

  # def after_sign_in_path_for(resource)
  #   root_url
  # end
end
