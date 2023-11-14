module Carts
  class ChangeQuantity < BaseService
    def initialize(params, cart_item, product)
      @params = params
      @cart_item = cart_item
      @product = product
    end

    def call
      return update_quantity if @params[:quantity]
      return increase_quantity if @params[:operation] == "plus"

      decrease_quantity
    end

    private

    def increase_quantity
      @cart_item.update(quantity: @cart_item.quantity + 1) if @cart_item.quantity < @product.quantity
    end

    def decrease_quantity
      @cart_item.update(quantity: @cart_item.quantity - 1) unless @cart_item.quantity == 1
    end

    def update_quantity
      @cart_item.update(quantity: @params[:quantity]) if @params[:quantity].to_i <= @product.quantity
    end
  end
end