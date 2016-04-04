class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
      )

    if user
      sign_in(user)
      redirect_to goals_url
    else
      flash[:errors] = "you fuck up mad bro"
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to goals_url
  end
end
