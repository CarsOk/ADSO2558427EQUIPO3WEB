class TraysController < ApplicationController
  before_action :set_product
  before_action :set_tray, only: [:show, :edit, :update, :destroy]

  def index
    @trays = @product.trays
  end

  def show
  end

  def new
    @tray = @product.trays.build
  end

  def create
    @product = Product.find(params[:product_id])
    @tray = @product.trays.build(tray_params)
    @tray.image.attach(params[:tray][:image]) # Adjunta la imagen al objeto @tray
    if @tray.save
      redirect_to product_tray_path(@product, @tray), notice: 'La nueva bandeja fue creada exitosamente.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @tray.update(tray_params)
      redirect_to product_tray_path(@product, @tray), notice: 'Los cambios de la bandeja fueron guardados exitosamente.'
    else
      render :edit
    end
  end

  def destroy
    @tray.destroy
    redirect_to product_trays_path(@product), notice: 'La bandeja fue eliminada exitosamente.'
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_tray
    @tray = @product.trays.find(params[:id])
  end

  def tray_params
    params.require(:tray).permit(:name, :description, :price, :image)
  end
end
