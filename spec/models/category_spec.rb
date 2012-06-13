require 'spec_helper'

describe Category do

	before(:each) do
		@attr = {
						:name=>"CategoryName",
						:description => "CategoryDescription"
		}
	end
	
	it "should have a name attribute" do
		category = Category.new(@attr)
  	category.should respond_to(:name)
 	end

	it "should have a description attribute" do
		category = Category.new(@attr)
  	category.should respond_to(:description)
 	end

	it "should create a new instance given a valid attribute" do
  	valid_category = Category.create!(@attr)
		valid_category.should be_valid
  end

  it "should require a blank category name" do
  	category_no_name = Category.new(@attr.merge(:name => ""))
  	category_no_name.should_not be_valid
  end
  
  it "should reject names that are more than 30 characters long" do
  	long_name = "a"*31
  	category_long_name = Category.new(@attr.merge(:name => long_name))
  	category_long_name.should_not be_valid
  end
  
  it "should reject descriptions that are more than 250 characters long" do
	  long_description = "a" * 251
  	category_long_description = Category.new(@attr.merge(:description=>long_description))
  	category_long_description.should_not be_valid
  end
  
end

# == Schema Information
#
# Table name: categories
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

