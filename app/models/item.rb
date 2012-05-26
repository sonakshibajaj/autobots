class Item < ActiveRecord::Base

	attr_accessible :name, :description, :short_name, :price, :favourite_flag
	
	validates :name, :presence=>true,
									 :length=>{:maximum=>50}
	validates :description, :length=> {:maximum => 250}
	
	validates :short_name, :presence=>true,
									 :length=>{:maximum=>4}
	validates :price, :presence=>true
	validates	:favourite_flag, :presence=>true
end


# == Schema Information
#
# Table name: items
#
#  id             :integer         not null, primary key
#  name           :string(255)
#  description    :string(255)
#  short_name     :string(255)
#  favourite_flag :boolean
#  created_at     :datetime
#  updated_at     :datetime
#  price          :float
#

