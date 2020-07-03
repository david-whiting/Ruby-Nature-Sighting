class CategoriesController < ApplicationController

  def index
    @categories = Category.all 
    @searched_category = Category.find_by(name: params[:category_name])
  end

  def show
  end

end
