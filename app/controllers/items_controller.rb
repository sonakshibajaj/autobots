class ItemsController < ApplicationController
  

 	def create
		@attr = params[:item]	
		@attr["favourite_flag"] = (@attr["favourite_flag"] == "1" )
		@attr["category_id"] = params[:category_id]
		@item = Item.create(@attr)
		if @item.save
			redirect_to @item
		else
			redirect_to 'new'
		end
		
  end

  def new
		@category = Category.find(params[:id])
		@item = Item.new 
  end

  def show
		@item = Item.find(params[:id])
  end

  def destroy
  end

  def edit
  end

end
