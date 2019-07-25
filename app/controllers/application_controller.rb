class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    include SessionsHelper

    private
    def check_admin_user
      unless logged_in? && current_user.admin?
        flash[:danger] = "You cannot access this page!"
        redirect_to(root_url)
      end
    end
end