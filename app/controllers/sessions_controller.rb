class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      params[:session][:remember_me] == '1' ? remember(@user) : forget(@user)
      redirect_to @user
      flash[:success] = "Welcome back #{@user.name}."
    elsif !@user
      flash.now[:danger] = 'Email not found'
    render 'new'
    elsif !@user.authenticate(params[:session][:password])
      flash.now[:danger] = 'Incorrect password'
    render 'new'
    else
      flash.now[:danger] = 'Unknown error occurred'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end