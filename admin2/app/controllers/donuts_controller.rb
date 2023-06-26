class DonutsController < ApplicationController
  before_action :set_product
  before_action :set_donut, only: [:show, :edit, :update, :destroy]

  def index
    @donuts = @product.donuts
  end

  def show
  end

  def new
    @donut = @product.donuts.build
  end

  def create
    @product = Product.find(params[:product_id])
    @donut = @product.donuts.build(donut_params)
    @donut.image.attach(params[:donut][:image]) # Adjunta la imagen al objeto @donut
    if @donut.save
      redirect_to product_donut_path(@product, @donut), notice: 'El nuevo donut fue creado exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @donut.update(donut_params)
      redirect_to product_donut_path(@product, @donut), notice: 'Los cambios del donut fueron guardados exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @donut.destroy
    redirect_to product_donuts_path(@product), notice: 'El donut fue eliminado exitosamente.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_donut
    @donut = @product.donuts.find(params[:id])
  end

  def donut_params
    params.require(:donut).permit(:name, :description, :price, :image)
  end
end
