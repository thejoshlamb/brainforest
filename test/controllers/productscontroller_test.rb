require 'spec_helper'

let 

describe 'ProductsController' do

	it 'should return 200 from index' do
		get :index
		expect(response).to be_success
		expect(response.status).to eq(200)
	end

	it 'should return all products from the database' do
		product = Product.create
		get :index
		expect(assigns[:products]) to eq([product])
end

describe 'GET show' do

	it 'shoudl assign a product' do
		get :show, id: 1
		assert(assigns[:product]).to eq(product)
	end
end

describe 'POST create' do
	it 'should create a new product' do
		Product.stub(:new){ product }
		product.mock(:save).and_return(true)
		post :create, product: {title: 'title', description: 'description'}
		expect(Product.all.length).to eq(1)
	end

	it 'should not save an invalid product' do
		post :create, product: {description: "description"}
		expect(response).to render_template("new")
	end
end

