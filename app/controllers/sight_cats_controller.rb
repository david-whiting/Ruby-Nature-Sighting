class SightCatsController < ApplicationController

  def index
    @sight_cats = SightCat.all 
  end

  def show
  end

end
