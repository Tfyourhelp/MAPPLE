class CheckoutsController < ApplicationController
  def create
    @session = Stripe::Checkout::Session.create({
      payment_method_types: ['card'],
      subscription_data: {
        trial_period_days: 30,
      },
      line_items: [{
        price: '{PRICE_ID}',
        quantity: 1,
      }],
      mode: 'subscription',
      success_url: 'https://example.com/success',
      cancel_url: 'https://example.com/cancel',
    })
  end

  # def success
  #   @user = User.find_by(email: params[:password_reset][:email].downcase)
  #   if @user
  #     @user.send_order_confirmation_email
  #     flash[:info] = "Email sent with password reset instructions"
  #     redirect_to root_url
  #   else
  #     flash.now[:danger] = "Email address not found"
  #     render "new"
  #   end
  # end

