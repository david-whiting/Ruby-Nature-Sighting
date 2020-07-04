class SightsController < ApplicationController
	before_action :authentication_required

	def index
      if params[:user_id]
        @sights = User.find(params[:user_id]).sights
      elsif params[:category_name]
      	@sights = Sight.search_category(params[:category_name])
      else
        @sights = Sight.all
      end
    end

	def show
      @sight = Sight.find(params[:id])
	end

  	def new
      @sight = Sight.new
      #@bird.build_category
  	end

	def create
	  @sight = current_user.sights.build(sight_params)
		if @sight.save
			flash[:success] = "Your sighting was sucessfully created!"
		  	redirect_to sight_url(@sight)
	  	else
	  	 	flash[:danger] = "Please try again"
			@sights = Sight.all
			render :index
		end
	end

	def edit
	  @sight = Sight.find(params[:id])
	end

	def update
	  @sight = Sight.find(params[:id])
	  if @sight.update(sight_params)
		  flash[:success] = "Your sighting was sucessfully updated!"
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
	  params.require(:sight).permit(:title, :content, category_ids:[], categories_attributes: [:name])
	end
end