Rails.application.routes.draw do
  devise_for :users, controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}
  root 'products#home'
  resources :products do
    resources :breads
    resources :donuts
    resources :trays
  end
  resources :breads
   resources :donuts
   resources :trays
end
