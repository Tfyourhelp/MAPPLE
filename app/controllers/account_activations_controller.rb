class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in(user, "user")
      redirect_to user, notice: "Account activated!", flash: { class: "success" }
    else
      redirect_to root_url, notice: "Invalid activation link", flash: { class: "danger" }
    end
  end
end
