class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:session][:email].downcase == "mapple@gmail.com"
      shop = Shop.first
      if shop && shop.authenticate(params[:session][:password])        
        log_in(shop,"shop") 
        params[:session][:remember_me] == '1' ? remember(shop,"shop") : forget(shop, "shop") 
        redirect_back_or root_path 
      end
    else
      user = User.find_by(email: params[:session][:email].downcase) 
      if user && user.authenticate(params[:session][:password]) 
        if user.activated?
          log_in(user,"user") 
          params[:session][:remember_me] == '1' ? remember(user,"user") : forget(user, "user") 
          redirect_back_or root_path
        else
          message = "Account not activated. "
          message += "Check your email for the activation link. "
          flash[:warning] = message
          redirect_to root_url
        end
      else
        flash.now[:danger] = 'Invalid email/password combination' 
        render 'new' , status: :unprocessable_entity
      end
    end
  end

  def destroy
    log_out(params[:person_type]) if logged_in?(params[:person_type])
    redirect_to root_url
  end
end
