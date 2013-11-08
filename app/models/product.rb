class Product < ActiveRecord::Base

	validates :description, :name, :presence => true
	validates :price_in_cents, :numericality => {:only_integer => true}
	validates :price_in_cents, :numericality => {:greater_than => 0}
end
