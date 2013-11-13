require 'spec_helper'

describe Product do

	let!(:product) { Product.create }
	subject { zombie }

	it "must have a name" do
		product.name.should_not == nil
	end

	it "must have a description" do
		product.description.should_not == nil
	end

	it "must have a positive price" do
		product.price_in_cents.should > 0
	end

	it "must display a formatted price" do
		product.formatted_price.class.should == Float
	end

	it "can have many reviews" do
	end

	it "can list users that have reviewed it without duplicates" do
	end

end