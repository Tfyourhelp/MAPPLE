module Users
  class AccountActivationsController < Users::BaseController
    before_action :find_user, only: [:edit]

    def edit
      if @user && !@user.activated? && @user.authenticated?(:activation, params[:id])
        activate_user(@user)
      else
        redirect_to users_root_url, alert: "Invalid activation link"
      end
    end

    private

    def activate_user(user)
      user.activate
      log_in(user, "user")
      redirect_to users_root_url, notice: "Account activated!"
    end

    def find_user
      @user = User.find_by(email: params[:email])
      redirect_to user_root_path, alert: "User not found" if @user.nil?
    end
  end
end
