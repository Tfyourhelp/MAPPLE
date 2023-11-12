module Users
  class PasswordResetsController < Users::BaseController
    before_action :find_user, only: [:edit, :update]
    before_action :valid_user, only: [:edit, :update]
    before_action :check_expiration, only: [:edit, :update]

    def new; end

    def create
      @user = User.find_by(email: params[:password_reset][:email].downcase)
      if @user
        @user.create_reset_digest
        @user.send_password_reset_email
        redirect_to root_url, notice: "Email sent with password reset instructions", flash: { class: "info" }
      else
        flash.now[:danger] = "Email address not found"
        render "new", status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        log_in(@user, "user")
        @user.update_attribute(:reset_digest, nil)
        redirect_to users_user_url(@user), notice: "Password has been reset.", flash: { class: "success" }
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def find_user
      @user = User.find_by(email: params[:email])
    end

    def valid_user
      redirect_to root_url unless @user && @user.activated? && @user.authenticated?(:reset, params[:id])
    end

    def check_expiration
      redirect_to new_password_reset_url, notice: "Password reset has expired", flash: { class: "danger" } if @user.password_reset_expired?
    end
  end
end
