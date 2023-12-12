class ReviewsController < ApplicationController
  before_action :set_review, only: %i[ show edit update destroy ]
  before_action :protect_pages
  before_action :only_user_id
  skip_before_action :only_user_id, only: [:new,:create]

  #skip_before_action :only_user_id, only: [:index]
  #skip_before_action :protect_pages, only: [:show, :index]
  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @product = Product.find(params[:products_id])
    @review = @product.review.find(params[:id])
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @product = Product.find(params[:products_id])
         
    @review = @product.review.new(review_params)
    
    @review.user_id = current_user.id 
    
    if @review.save
      @variable = @product.review
      redirect_to product_path(@product)
    else
      
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    @product = Product.find(params[:products_id])
    @review = @product.review.find(params[:id])

    if @review.update(review_params)
      redirect_to show_reviews_path

    else
      render :edit, status: :unprocessable_entity
    end 
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_review
    @review = Review.find(params[:id])
  end

    # Only allow a list of trusted parameters through.
  def review_params
    params.require(:review).permit(:description)
  end

  def protect_pages
    redirect_to '/login'  unless current_user
  end

    
  def only_user_id
    @product = Product.find(params[:products_id])
    @review = @product.review.find(params[:id])

    if (@review.user_id == current_user.id)


    else
      redirect_to products_path, notice: 'ESTA REVIEW NO TE PERTENECE'
    end 
end 
end
