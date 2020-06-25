class SightsController < ApplicationController
	before_action :authentication_required 

	def index
		#if you're not logged in, you can't see this. Go back to the login page.
	  @sights = Sight.all
	end

	def show
      @sight = Sight.find(params[:id])
	end

  	def new
      @sight = Sight.new
  	end

	def create
  	@sight = Sight.new(sight_params)

	  if @sight.save
		flash[:success] = "Your sighting was sucessfully created!"
		redirect_to sight_url(@sight)
	  else
		@sights = Sight.all
		render :new
		#render :index
	  end
	end

	def edit
	  @sight = Sight.find(params[:id])
	end

	def update
	  @sight = Sight.find(params[:id])
      if @sight.update(sight_params)
      	  flash[:success] = "Your sighting was sucessfully updated!"
       	  #validations -- render keeps @post info/error messages vs. redirect
	      redirect_to sight_path(@sight)
	  else
	  	render :edit
	  end
	end

	def destroy
      @sight = Sight.find(params[:id]).destroy
      flash[:success] = "Your sighting was sucessfully deleted!"

      #back to index
	  redirect_to sights_path
  end

	def sight_params #strong parameters
	  params.require(:sight).permit(:title, :content)
	end
end
