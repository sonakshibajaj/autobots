class CategoriesController < ApplicationController

  def new
		@category = Category.new
  end

	def edit
		@category = Category.find(params[:id])
	end
	
	def update
		@category = Category.find(params[:id])
		if @category.update_attributes(params[:category])
			redirect_to @category
		end
	end

  def create
		@category = Category.new(params[:category])
		if @category.save
			redirect_to @category		
		else
			render 'index'
		end
  end

  def show
		@category = Category.find(params[:id])
		category_name = @category.name	
		@title = "#{category_name} : Details"
		return @category
  end

  def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :categories
  end

	def index
		@category = Category.new
	end


end
