class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
  include Blacklight::Controller
  layout 'blacklight'

  after_filter :store_location

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def store_location
    # store last url - this is needed for post-login redirect to whatever the user last visited
    return unless request.get?

    if (
        request.path != '/users/sign_in' &&
        request.path != '/users/sign_out' &&
        !request.xhr? # don't store ajax calls
    )
      session[:previous_url] = request.fullpath
    end
  end

  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
    #sign_in_url = new_user_session_url
    #if request.referer == sign_in_url
      #super
    #else
      #root_path
    #end
  end
end
