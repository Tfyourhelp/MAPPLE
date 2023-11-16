module Shops
  class PasswordChangesController < Shops::BaseController
    before_action :user_not_allow_here
    before_action :logged_in_shop, only: [:edit, :update]
    before_action :find_shop, only: [:edit, :update]

    def edit; end

    def update
      if @shop && @shop.authenticate(params[:shop][:current_password])
        if @shop.update(shop_change_password_params)
          redirect_to shops_shop_url(@shop), notice: "Password has been reset."
        else
          render :edit, status: :unprocessable_entity
        end
      else
        flash.now[:danger] = "Your current password is wrong"
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def shop_change_password_params
      params.require(:shop).permit(:password, :password_confirmation)
    end
  end
end
