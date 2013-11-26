class ReviewsController < ApplicationController

  before_filter :ensure_logged_in, :only => [:edit, :create, :update, :destroy]

	before_filter :load_product

  def show
  	@review = Review.find(params[:id])
  end

  def create
  	@review = @product.reviews.build(review_params)
  	@review.user_id = current_user.id

    sleep(1)

    respond_to do |format|
    	if @review.save
    		format.html{ redirect_to product_path(params[:id]), notice: 'Review posted!'}
        format.js {} # This will look for app/views/reviews/create.js.erb
        # format.json { @review } to return as a json object
    	else
    		format.html{ render :action => :show }
        format.js {} # This will look for app/views/reviews/create.js.erb
    	end
    end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
    redirect_to product_path(params[:product_id]), notice: 'Review deleted.'
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
