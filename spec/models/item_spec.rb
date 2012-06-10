require 'spec_helper'

describe Item do
  
  before(:each) do
		@cat_attr = {:name => "unique", :description => "test desc"}
		@category = Category.create!(@cat_attr)
  	@attr = {:name=>"ItemName", :description=>"ItemDescription", :price => 50.5 , :favourite_flag => true, :short_name => "it01", :category_id => @category.id}
		
  end
  
  it "should not have a blank name" do
  	item_no_name = Item.new(@attr.merge(:name=>""))
  	item_no_name.should_not be_valid
  end
  
  it "should not have a blank short name" do
  	item_no_short_name = Item.new(@attr.merge(:short_name=>""))
  	item_no_short_name.should_not be_valid
  end
  
 	it "should not have price as nil" do
  	item_nil_price = Item.new(@attr.merge(:price=>nil))
  	item_nil_price.should_not be_valid
  end
  
    
  it "should not have a name more than 50 characters" do
  	long_name = "a"*51
  	item_long_name = Item.new(@attr.merge(:name => long_name))
  	item_long_name.should_not be_valid
  end
  it "should have a unique name" do
  	item_valid = Item.create!(@attr)
  	item_invalid = Item.new(@attr.merge(:short_name => "it02"))
  	item_invalid.should_not be_valid
  end
  it "should have a unique short name" do
  	item_valid = Item.create!(@attr)
  	item_invalid = Item.new(@attr.merge(:name => "testItem2"))
  	item_invalid.should_not be_valid
  end
  
  it "should not have a description more than 250 characters" do
	  long_description = "a" * 251
  	item_long_description = Item.new(@attr.merge(:description=>long_description))
  	item_long_description.should_not be_valid
  end
  
  it "should not have a short name more than 4 characters" do
  	long_name = "a"*5
  	item_long_name = Item.new(@attr.merge(:short_name => long_name))
  	item_long_name.should_not be_valid
  end
  
  it "should not have a blank category id" do
  	item_nil_category_id = Item.new(@attr.merge(:category_id=>nil))
  	item_nil_category_id.should_not be_valid
  end
  
  it "should have a valid category_id" do
  
  	item_invalid_category_id = Item.new(@attr.merge(:category_id=>2))
   	item_invalid_category_id.category.should be_blank
   end
 
  it "should create a valid item" do
  	valid_item = Item.new(@attr)
  	valid_item.should be_valid
  end  
   
  
end



# == Schema Information
#
# Table name: items
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :string(255)
#  price          :float
#  short_name     :string(255)
#  favourite_flag :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  category_id    :integer
#

