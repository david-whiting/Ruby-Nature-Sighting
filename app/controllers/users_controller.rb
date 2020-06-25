class UsersController < ApplicationController

    def new
      @user = User.new
    end

	def create
	  	@user = User.new
	  	@user.name = params[:user][:name]
	  	@user.email = params[:user][:email]
		@user.password = params[:user][:password]
		
	  if @user.save
	  	redirect_to root_path #=> GET "/"
		
	  else
	  	render 'users/new' #show them the form
	  end
	end

end
