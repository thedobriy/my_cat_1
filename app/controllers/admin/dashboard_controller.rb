class Admin::DashboardController < ApplicationController

  before_filter :admin_user

  def index
  end

  private
    def admin_user
      if signed_in?
        redirect_to(root_url) unless current_user.admin?
      else
        redirect_to(home_url)
      end
    end

end
