class Review < ActiveRecord::Base

	belongs_to :product
	belongs_to :user

	# before_validation :make_price_an_integer

	validates :comment, :rating, :presence => true
	#validates :price_in_cents, :numericality => {:only_integer}


end
