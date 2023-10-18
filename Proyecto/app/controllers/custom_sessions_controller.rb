class CustomSessionsController < Devise::SessionsController
    def new
    @user = User.new
    end
end
