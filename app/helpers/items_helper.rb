module ItemsHelper

	def current_category_id=(category)
		puts "#########################"
		puts category
		@category_id = category.id
	end

	def current_category_id 
		@category_id
	end
	
end
