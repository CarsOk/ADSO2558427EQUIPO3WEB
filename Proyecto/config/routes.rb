Rails.application.routes.draw do
  devise_for :users
  root 'paginas#tienda'
  get '/tienda', to: 'paginas#tienda', as: 'tienda'
  get '/acerca', to: 'paginas#acerca', as: 'acerca'
  get '/contacto', to: 'paginas#contacto', as: 'contacto'
  get '/about', to: 'paginas#about', as: 'about'



end
