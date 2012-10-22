class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Albumizr!"
      redirect_to root_path
    else
      flash.now[:error] = "Error"
      render 'new'
    end
  end

end