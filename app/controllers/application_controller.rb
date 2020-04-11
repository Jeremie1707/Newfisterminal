class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  def authenticate_admin_user!
    authenticate_user!
    unless current_user.admin == true
      flash[:alert] = "Unauthorized Access!"
      redirect_to root_path
    end
  end

  protected

  def user_for_paper_trail
    current_user ? current_user.id : 'Unknown user'
  end

end

