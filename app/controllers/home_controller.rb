class HomeController < ApplicationController
  def index
  end
  def show
    @request = Request.where(estad0: nil)


  end
  def aceptadas 
    @request = Request.where(estad0: "Aceptado")
  end 

  def update
    @product = Product.find(params[:products_id])
    @request = @product.request.find(params[:id])
    @estado = params[:bool]
    @request.update(estad0: "Aceptado")

    redirect_to show_all_request_path

  end 
end
