module Shops
  class ShopsController < Shops::BaseController
    before_action :user_not_allow_here
    before_action :logged_in_shop
    before_action :find_shop, only: [:show, :edit, :update]

    def show; end

    def edit; end

    def update
      if @shop.update(shop_params)
        redirect_to shops_shop_url, notice: "Shop profile updated"
      else
        render 'edit', status: :unprocessable_entity
      end
    end

    private

    def shop_params
      params.require(:shop).permit(:name, :email, :password, :password_confirmation, :phone, :address, :description, :tax_code)
    end
  end
end
