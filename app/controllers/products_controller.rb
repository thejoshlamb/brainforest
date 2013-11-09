class ProductsController < ApplicationController

  before_filter  :ensure_logged_in, :only => [:show]

  def index
  	@products = Product.all
  end

  def show
  	@product = Product.find(params[:id])

  	if current_user
  		@review = @product.reviews.build
  	end

  	respond_to do |format|
  		format.html #show.html.erb
  		format.json { render json: @product }
  	end
  end

  def new
  	@product = Product.new
  end

  def edit
  	@product = Product.new(params[:id])
  end

  def create
  	@product = Product.new(product_params)
  	if @product.save
  		redirect_to products_url
  	else
  		render :new
  	end
  end

  def update
  	@product = Product.find(params[:id])

  	if @product.update_attributes(product_params)
  		redirect_to product_path(@product)
  	else
  		render :edit
  	end
  end

  def destroy
  	@product = Product.find(params[:id])
  	@product.destroy
  	redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:name, :description, :price_in_cents, :rating)
  end

end
