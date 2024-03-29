class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_name(params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Invalid email and/or password'
      render 'new'
    end
  end

  def destroy
    sign_out
    flash[:error] = 'We will miss you here at Albumizr!'
    redirect_to root_path
  end

end