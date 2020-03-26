class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin == true
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end
end

