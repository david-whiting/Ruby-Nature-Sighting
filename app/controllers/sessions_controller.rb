class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:email => params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in!"
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Sucessfully logged out!"
    redirect_to root_path
  end

  def omniauth
    @user = User.from_omniauth(auth)
    @user.save
    session[:user_id] = @user.id
    redirect_to root_path
  end

  private
  def auth
    request.env['omniauth.auth']
  end


end

