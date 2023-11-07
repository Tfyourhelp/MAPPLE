class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    dfdf
    @like = Like.new(user_id: current_person("user").id, product_id: params[:id])
    @like.save
    dfdf
    respond_to do |format|
      #format.js
      format.html { redirect_to products_path }
      format.json { render json: { message: "Unlike thành công" } }
    end
  end

  def destroy
    @like = Like.find_by(user_id: current_person("user").id, product_id: params[:id])
    @like.destroy
    dfdfdf
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
    dfdf
  end
end
