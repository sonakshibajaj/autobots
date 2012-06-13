require 'spec_helper'

describe CategoriesController do
	render_views

	before(:each) do
			@base_title = "Autobots"
			@attr = {:name => "Test Category", :description => "Test category description"}
			@category = Category.create(@attr)
	end

	describe "GET 'show'" do

    it "should be successful" do
      get :show, :id => @category
      response.should be_success
    end

		it "should find the right category" do
			get :show, :id => @category
			assigns(:category) == @category
		end
		
		it "should have the right title" do
			get :show, :id => @category
			response.should have_selector('title', 
											:content => "#{@base_title} | #{@category.name} : Details")
		end
		
		it "should have the category name" do
			get :show, :id => @category
			response.should have_selector('div', :content => @category.name)
		end
	
		it "should have the category description" do
			get :show, :id => @category
			response.should have_selector('div', :content => @category.description)
		end
		
		it "should have a link to edit the category" do
			get :show, :id => @category
			response.should have_selector('a',:content => "Edit",
																				:href		=> edit_category_path(@category))
		end

		it "should have a button to delete the category" do
			get :show, :id => @category
			response.should have_selector('input',:value => "Delete Category",
																				:type		=> "submit")
		end	

		it "should have a link to add an item" do
			get :show, :id => @category
			response.should have_selector('a',:content => "Add Item",
																				:href		=> "/items/new?id=#{@category.id}")
		end

		
		it "should show the items for the category" do
			get :show, :id => @category
			@category.items.all.each do |item|
				response.should have_selector('td>a',:content => item.name,
																						 :href => "items/show?id=#{item.id}")
			end
		end
		

  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create', :category => @attr.merge({:name => "TestCategoryName", :description => "Test Category"})	
		@category=	Category.find_by_name("TestCategoryName")		
      response.should redirect_to @category
    end
  end

  

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id=>@category
      response.should redirect_to :categories
    end
  end

end
