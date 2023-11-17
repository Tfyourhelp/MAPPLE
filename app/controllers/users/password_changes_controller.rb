module Users
  class PasswordChangesController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:edit, :update]
    before_action :find_and_correct_user, only: [:edit, :update]

    def edit; end

    def update
      if @user && @user.authenticate(params[:user][:current_password])
        if @user.update(user_change_password_params)
          redirect_to users_user_url(@user), notice: "Password has been reset."
        else
          render :edit, status: :unprocessable_entity
        end
      else
        flash.now[:danger] = "Your current password is wrong"
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def user_change_password_params
      params.require(:user).permit(:password, :password_confirmation)
    end

    def find_and_correct_user
      @user = User.find_by(id: params[:id])
      redirect_to users_root_url, alert: "User not found" if @user.nil?
      redirect_to users_root_url, alert: "This is not your area" unless current_person?(@user, "user")
    end
  end
end
