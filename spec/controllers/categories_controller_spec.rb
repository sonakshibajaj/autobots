require 'spec_helper'

describe CategoriesController do
	render_views

	before(:each) do
			@attr = {:name => "Test Category", :description => "Test category description"}
			@category = Category.create(@attr)
		end

#  describe "GET 'new'" do
#    it "should be successful" do
#      get 'new'
#      response.should be_success
#    end
#  end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create', :category => @attr.merge({:name => "TestCategoryName", :description => "Test Category"})	
		@category=	Category.find_by_name("TestCategoryName")		
      response.should redirect_to @category
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id=>@category
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy', :id=>@category
      response.should redirect_to :categories
    end
  end

end
