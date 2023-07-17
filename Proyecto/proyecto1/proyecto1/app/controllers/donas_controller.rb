class DonasController < ApplicationController
  def comprar
    @donas = Dona.all
  end

  def carrito
  end

  def favorito
  end
end
