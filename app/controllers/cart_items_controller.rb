class CartItemsController < ApplicationController
  before_action :logged_in_user, only: [:index, :create, :edit, :update, :destroy]
  before_action :find_cart_item, only: [:destroy]

  def destroy
    @cart_item.destroy
  end

  private

  def find_cart_item
    @cart_item = CartItem.find(params[:id])
  end
end