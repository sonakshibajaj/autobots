require 'spec_helper'

describe ItemsController do

	before(:each) do
			@attr = {:name => "Test Category", :description => "Test category description"}
			@category = Category.create!(@attr)
			@item_attr = {:name => "Test Item Name", :description => "Test item description", :favourite_flag => true, :price => '40', :short_name => "TI1", :category_id => @category.id}
			@item = Item.create(@item_attr)
		end

  describe "GET 'create'" do
    it "should be successful" do
      get 'create', :item => @item_attr.merge({:name => "TestItemName", :description => "Test Item"}), :category_id => @category.id
			
			@item = Item.find_by_name("TestItemName")
      response.should redirect_to @item
    end
  end

  describe "GET 'new'" do
    it "should be successful" do
      get 'new', :id => @category
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "should be successful" do
      get 'show', :id => @item
      response.should be_success
    end
  end

  describe "GET 'destroy'" do
    it "should be successful" do
      get 'destroy'
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "should be successful" do
      get 'edit'
      response.should be_success
    end
  end

end
