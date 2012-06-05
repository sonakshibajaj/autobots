class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  	render :show
  end

  def create
  end

  def show
  end

  def destroy
  end

	def index
		@category = Category.all
	end

end
