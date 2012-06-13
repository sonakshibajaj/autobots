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

  describe "POST 'create'" do

		describe "failure" do
  	
			before(:each) do
				@attr = {:name => "", :description => ""}
			end

  		it "should have the right title" do
  			post :create, :category => @attr
				response.should have_selector('title', :content => "Categories")
  		end
			
			it "should render the index page" do
				post :create, :category => @attr
				response.should render_template('index')
			end
			
			it "should not create a category" do
				lambda do
					post :create, :category => @attr
				end.should_not change(Category, :count)
			end
			
  	end

		describe "success" do
			
			before(:each) do
				@attr = {:name => "New Category Name",
								 :description => "New Category Description"
				}
			end

			it "should create a category" do
				lambda do
					post :create, :category => @attr
				end.should change(Category, :count).by(1)
			end
			
			it "should redirect to the category show page" do
				post :create, :category => @attr
				response.should redirect_to(category_path(assigns(:category)))
			end
				
			it "should have a welcome message" do
				post :create, :category => @attr
				flash[:success].should =~ /category was successfully created/i
			end
	
		end

  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id=>@category
      response.should redirect_to :categories
    end
  end

end
