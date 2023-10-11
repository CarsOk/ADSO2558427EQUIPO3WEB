class SessionsController <  < Devise::SessionsController
  layout 'login_layout', only: [:new, :create, :destroy]
  def new
    if current_user
      redirect_to root_path
    else
      super
    end
  end

  def create
    super do |user|
      session[:user_id] = user.id if user.persisted?
    end
  end

  def destroy
    super do
      session[:user_id] = nil
    end
  end
end
