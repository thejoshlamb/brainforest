class ReviewsController < ApplicationController

  before_filter :ensure_logged_in, :only => [:edit, :create, :show, :update, :destroy]

	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

  	# @review = Review.new
  	#  :comment => params[:review][:comment]
  	#  :product_id => @product_id
  	#  :user_id => current_user.id

  	if @review.save
  		redirect_to product_path(params[:id]), notice: 'Review posted!'
  	else
  		render :action => :show
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  def edit
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
