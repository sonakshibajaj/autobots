class CategoriesController < ApplicationController

  def new
		@category = Category.new
  end

  def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to @category		
		else
			render :index
		end
  end

  def show
		@category = Category.find(params[:id])
		
  end

  def destroy
  end

	def index
		@category = Category.new
	end

end
