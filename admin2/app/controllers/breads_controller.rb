class BreadsController < ApplicationController
  before_action :set_product
  before_action :set_bread, only: [:show, :edit, :update, :destroy]

  def index
    @breads = @product.breads
  end

  def show
  end

  def new
    @bread = @product.breads.build
  end

  def create
    @product = Product.find(params[:product_id])
    @bread = @product.breads.build(bread_params)
    @bread.image.attach(params[:bread][:image]) # Adjunta la imagen al objeto @bread
    if @bread.save
      redirect_to product_bread_path(@product, @bread), notice: 'El nuevo pan fue creado exitosamente.'
    else
      render :new
    end
  end
  
  
  def edit
  end

  def update
    if @bread.update(bread_params)
      redirect_to product_bread_path(@product, @bread), notice: 'Los cambios del pan fueron guardados exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @bread = Bread.find(params[:id])
    @bread.destroy
    redirect_to product_breads_path(@product), notice: 'El pan fue eliminado exitosamente.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_bread
    @bread = @product.breads.find(params[:id])
  end

  def bread_params
    params.require(:bread).permit(:name, :description, :price, :image)
  end
end
