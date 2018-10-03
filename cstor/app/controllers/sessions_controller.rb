class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      set_user(user)

      redirect_to resources_path
    else
      @errors = ["Login failed."]
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to resources_path
  end
end
