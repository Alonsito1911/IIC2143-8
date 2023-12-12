class CategoriesController < InheritedResources::Base
  def new
    @category = Category.new
  end 

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to products_path, notice: 'CATEGORIA CREADA'
    else
      render json: @request.errors, status: :unprocessable_entity
    end
  end


  private

  def category_params
    params.require(:category).permit(:tipo)
  end

end
