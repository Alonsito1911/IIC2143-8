class ProductsController < ApplicationController
  before_action :protect_pages 
  skip_before_action :protect_pages, only: [:show, :index]
  def index
    @categories  = Category.all 
    @products = Product.all
    if params[:category_id]
      @products = @products.where(category_id: params[:category_id])
    end
    if params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price])
    end
    if params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price])
    end

    if params[:query_text].present?
      @products = @products.search_full_text(params[:query_text])
    end
    @pagy, @products = pagy_countless(@products, items: 12)
  end 
  def show
    @product = Product.find(params[:id])
    @chatsExistentes = Chat.all
    @chat = Chat.new
  end
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    

    if @product.save
      redirect_to products_path

    else
      render :new, status: :unprocessable_entity

    end 
  end 

  def edit
    @product = Product.find(params[:id])
  end 

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path, notice: 'PRODUCTO ACTUALIZADO'

    else
      render :edit, status: :unprocessable_entity

    end 
      
  end 

  def destroy
    @product = Product.find(params[:id])
    @product.destroy 
    redirect_to products_path, notice: 'PRODUCTO ELIMINADO'
  end 
  private

  def product_params
    params.require(:product).permit(:title, :description, :price, :picture, :category_id)
  end 

  def protect_pages
    redirect_to root_path unless current_user
  end 

end













