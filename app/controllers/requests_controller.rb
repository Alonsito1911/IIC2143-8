class RequestsController < ApplicationController
  before_action :protect_pages 
  before_action :only_user_id
  skip_before_action :only_user_id, only: [:index,:new, :create]
    #skip_before_action :protect_pages, only: [:show, :index]
  def index
    @product = Product.find(params[:products_id])
      @request = @product.request.all
     
  end
  def new
    @request = Request.new
  end

  def show
    @product = Product.find(params[:products_id])
      @request = @product.request.find(params[:id])
  end
  def create
    @product = Product.find(params[:products_id])
       
      @request = @product.request.new(requests_params)

      @request.user_id = current_user.id 
      
      if @request.save
        @variable = @product.request
        redirect_to show_requests_path(@product,@request.id), notice: 'SOLICITUD CREADA'
      else
        render json: @request.errors, status: :unprocessable_entity
      end
  end
  def edit
    @product = Product.find(params[:products_id])
      @request = @product.request.find(params[:id])
  
  end 

   # GET /vaccines/1

  def update
    @product = Product.find(params[:products_id])
      @request = @product.request.find(params[:id])

      if @request.update(requests_params)
        redirect_to request_path, notice: 'SOLICITUD ACTUALIZADA ACTUALIZADO'

      else
        render :edit, status: :unprocessable_entity

  end 
  
  end 

  def destroy
    @product = Product.find(params[:products_id])
      @request = @product.request.find(params[:id])
      @request.destroy 
      redirect_to products_path, notice: 'SOLICITUD  ELIMINADA'


               
  end
    
        # Agregar al final de la clase por el control de accesos
    
  def requests_params
    params.require(:request).permit(:adress, :email, :amount)
  end

  def protect_pages
    redirect_to '/login' unless current_user
  
  end 


  def only_user_id
    @product = Product.find(params[:products_id])
      @request = @product.request.find(params[:id])

      if (@request.user_id == current_user.id)


      else
        redirect_to products_path, notice: 'ESTA SOLICITUD  NO TE PERTENECE'
      end 
  end 

end
