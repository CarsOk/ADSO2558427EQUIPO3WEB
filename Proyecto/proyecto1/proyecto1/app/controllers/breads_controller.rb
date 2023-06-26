class BreadsController < ApplicationController
  def comprar
    @breads = Bread.all
  end

  def carrito
  end

  def favorito
  end
end
