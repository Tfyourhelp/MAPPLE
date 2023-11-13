module Users
  class UsersController < Users::BaseController
    before_action :shop_not_allow_here
    before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
    before_action :correct_user, only: [:edit, :update]
    before_action :admin_user, only: [:destroy]
    before_action :find_user, only: [:show, :edit, :update, :destroy]
    before_action :find_all_info_orders, only: [:show]

    def show
      redirect_to users_root_url and return unless @user.activated?

      redirect_to users_root_url, notice: "This is not your profile account", flash: { class: "info" } unless current_person?(@user, "user")
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)
      if @user.save
        @user.send_activation_email
        redirect_to users_root_url, notice: "Please check your email to activate your account.", flash: { class: "info" }
      else
        render 'new', status: :unprocessable_entity
      end
    end

    def edit; end

    def update
      if @user.update(user_params)
        redirect_to users_user_url, notice: "Profile updated", flash: { class: "success" }
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    def destroy
      @user.destroy
      redirect_to users_url, notice: "User deleted", flash: { class: "success" }
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :address)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_person?(@user, "user")
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

    def find_user
      @user = User.find_by(id: params[:id])
      return unless @user.nil?

      redirect_to users_root_path, notice: "User not found", flash: { class: "danger" } unless @user
    end
  end
end
