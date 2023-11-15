module Users
  class UsersController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: [:destroy]
    before_action :find_user, only: [:show, :edit, :update, :destroy]

    def show
      @info_orders = InfoOrders::QueryInfoOrders.call(log_user, current_person("user"), params)
      redirect_to users_root_url unless @user.activated?

      redirect_to users_root_url, alert: "This is not your profile account" unless current_person?(@user, "user")
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_new_params)
      if @user.save
        update_image_to_user
        send_activation_email(@user)
        redirect_to users_root_url, notice: "Please check your email to activate your account."
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(user_edit_params)
        update_image_to_user
        redirect_to users_user_url, notice: "Profile updated"
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to users_url, alert: "User deleted"
    end

    private

    def user_new_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :address)
    end

    def user_edit_params
      params.require(:user).permit(:name, :email, :phone, :address)
    end

    def correct_user
      @user = User.find_by(id: params[:id])
      redirect_to users_root_url, alert: "User not found" if @user.nil?
      redirect_to(users_root_url) unless current_person?(@user, "user")
    end

    def find_user
      @user = User.find_by(id: params[:id])
      return unless @user.nil?

      redirect_to users_root_path, alert: "User not found" unless @user
    end

    def update_image_to_user
      @user.image.attach(params[:user][:image]) unless params[:user][:image].nil?
    end

    def send_activation_email(user)
      UserMailer.account_activation(user).deliver_now
    end
  end
end
