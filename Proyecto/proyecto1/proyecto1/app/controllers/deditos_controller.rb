class DeditosController < ApplicationController
  def comprar
    @deditos = Dedito.all
  end

  def carrito
  end

  def favorito
  end
end
