module ApplicationHelper
  include Devise::Controllers::StoreLocation

  # Stores the current URL and creates a link to click for 'Login'.
  def render_login_link
    store_location_for(:user, request.env['REQUEST_URI'])
    link_to t('blacklight.header_links.login'), new_user_session_path
  end

end
