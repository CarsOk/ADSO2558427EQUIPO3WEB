class Users::SessionsController < Devise::SessionsController
  layout 'login_layout' # Nombre del diseño específico para la vista de inicio de sesión

  # Sobrescribe el método después de iniciar sesión para redirigir al usuario a la vista home de ProductsController
  def after_sign_in_path_for(resource)
    root_path
  end

  # Sobrescribe el método después de cerrar sesión para redirigir al usuario a la ruta raíz
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
end
