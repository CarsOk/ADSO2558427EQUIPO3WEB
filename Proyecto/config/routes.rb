Rails.application.routes.draw do
  devise_for :users
  root 'paginas#tienda'
  get '/paginas/tienda', to: 'paginas#tienda', as: 'tienda'
  get '/paginas/acerca', to: 'paginas#acerca', as: 'acerca'
  get '/paginas/contacto', to: 'paginas#contacto', as: 'contacto'
  get '/paginas/about', to: 'paginas#about', as: 'about'
end
