Rails.application.routes.draw do
  get 'breads/comprar'
  get 'breads/carrito'
  get 'breads/favorito'
  get 'deditos/comprar'
  get 'deditos/carrito'
  get 'deditos/favorito'
  get 'donas/comprar'
  get 'donas/carrito'
  get 'donas/favorito'
  get 'dona/comprar'
  get 'dona/carrito'
  get 'dona/favoritos'
  get 'dedito/comprar'
  get 'dedito/carrito'
  get 'dedito/favorito'
  devise_for :users
  root 'paginas#tienda'
  get '/paginas/tienda', to: 'paginas#tienda', as: 'tienda'
  get '/paginas/acerca', to: 'paginas#acerca', as: 'acerca'
  get '/paginas/contacto', to: 'paginas#contacto', as: 'contacto'
  get '/paginas/deditos/comprar', to: 'deditos#comprar'
  get '/paginas/breads/comprar', to: 'breads#comprar'
  get '/paginas/donas/comprar', to: 'donas#comprar'


  
end
