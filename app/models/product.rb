class Product < ActiveRecord::Base

	mount_uploader :image1, ProductImageUploader
	mount_uploader :image2, ProductImageUploader
	mount_uploader :image3, ProductImageUploader
	mount_uploader :image4, ProductImageUploader
	mount_uploader :image5, ProductImageUploader

	belongs_to :user

	has_many :reviews
	has_many :users, :through => :reviews

	has_many :images

	validates :description, :name, :presence => true
	validates :price_in_cents, :numericality => {:only_integer => true, :greater_than => 0}

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		sprintf("%.2f",price_in_dollars)
	end

	def average_rating
		rsum = self.reviews.sum(:rating)
		rcount = self.reviews.count
		average = rsum/rcount.to_f
		sprintf("%.1f",average *= 100)
	end
end
