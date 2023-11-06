class ShopsController < ApplicationController
  before_action :logged_in_shop, only: [:edit, :update]
  before_action :find_shop_id, only: [:show, :edit, :update]

  def show
  end

  def edit
  end

  def update
    if @shop.update(shop_params)
      flash[:success] = "Shop profile updated"
      redirect_to @shop
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def shop_params
    params.require(:shop).permit(:name, :email, :password, :password_confirmation, :phone, :address, :description, :tax_code)
  end
end
