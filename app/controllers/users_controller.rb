class UsersController < ApplicationController

    def new
      @user = User.new
    end

	def create
	  @user = User.new(user_params)

	  if @user.save
	  	flash[:success] = "Welcome to the App!"
	  	session[:user_id] = @user.id
	  	redirect_to root_path #=> GET "/"

	  else
	  	render 'users/new' #show them the form
	  end
	end

	def show
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password)
	end

end
