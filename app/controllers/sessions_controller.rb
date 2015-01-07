class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email].downcase)
    if user && user.authenticate(params[:password])
      sign_in user
      redirect_back_or user
      flash[:notice] = t(:logged_in)
    else
      flash.now[:error] = t(:invalid_email_pass)
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
