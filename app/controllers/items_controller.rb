class ItemsController < ApplicationController
  

 	def create
		@attr = params[:item]	
		puts "########################"
		puts @attr["favourite_flag"]
		@attr["favourite_flag"] = (@attr["favourite_flag"] == "1" )
#			 = true 
#		else
#			@attr["favourite_flag"] = false 
#		end
		puts @attr["favourite_flag"]
		@attr["category_id"] = params[:category_id]
		puts @attr
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
