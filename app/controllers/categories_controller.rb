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
			redirect_to @category, :flash=>{:success	=> "The #{@category.name} category was successfully created"}		
		else
			@title = "Categories"
			render 'index'
		end
  end

  def show
		@category = Category.find(params[:id])
		@title = "#{@category.name} : Details"
  end

  def destroy
		@category = Category.find(params[:id])
		@category.destroy
		redirect_to :categories
  end

	def index
		@category = Category.new
		@title = "Categories"
	end


end
