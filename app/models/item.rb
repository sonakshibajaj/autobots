class Item < ActiveRecord::Base

	belongs_to :category
	attr_accessible :name, :description, :short_name, :price, :favourite_flag, :category_id
	
	validates :name, :presence=>true,
									 :length=>{:maximum=>50},
									 :uniqueness => {:case_sensitive => false}
	validates :description, :length=> {:maximum => 250}
	
	validates :short_name, :presence=>true,
									 :length=>{:maximum=>4},
									 :uniqueness => {:case_sensitive => false}
	validates :price, :presence=>true
	validates :category_id, :presence=>true
	validate :category_id_exists
	validate :favourite_flag_true_or_false

private

	def category_id_exists
			return false if self.category_id.nil?
			return false if Category.find(self.category_id).nil?
	end	

	def favourite_flag_true_or_false
		return false if !(self.favourite_flag == true ||  self.favourite_flag == false)
	end

end

#Animesh Commit - Changes

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

