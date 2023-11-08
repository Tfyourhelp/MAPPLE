class LikesController < ApplicationController
  before_action :logged_in_user
  before_action :find_product

  def create
    @like = Like.new(user_id: current_person("user").id, product_id: @product.id)
    @like.save
  end

  def destroy
    @like = Like.find_by(user_id: current_person("user").id, product_id: @product.id)
    @like.destroy
  end

  private

  def find_product
    @product = Product.find_by(id: params[:product_id])
    render json: false, status: :bad_request if @product.blank? #return
  end
end
