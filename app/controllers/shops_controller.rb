class ShopsController < ApplicationController
  before_action :logged_in_shop, only: [:show, :edit, :update]
  before_action :find_shop_id, only: [:show, :edit, :update]

  def show; end

  def edit; end

  def update
    if @shop.update(shop_params)
      redirect_to @shop, notice: "Shop profile updated", flash: { class: "success" }
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def shop_params
    params.require(:shop).permit(:name, :email, :password, :password_confirmation, :phone, :address, :description, :tax_code)
  end
end
