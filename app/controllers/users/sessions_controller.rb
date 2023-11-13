module Users
  class SessionsController < Users::BaseController
    before_action :request_login_page_while_logged_in, only: [:new]
    before_action :find_user, only: [:create]

    def new; end

    def create
      user = find_user
      if user && user.authenticate(params[:session][:password])
        if user.activated?
          activated_user(user)
        else
          unactivated_user
        end
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new', status: :unprocessable_entity
      end
    end

    def destroy
      log_out(params[:person_type]) if logged_in?(params[:person_type])
      redirect_to users_root_url
    end

    private

    def find_user
      User.find_by(email: params[:session][:email].downcase)
    end

    def activated_user(user)
      log_in(user, "user")
      params[:session][:remember_me] == '1' ? remember(user, "user") : forget(user, "user")
      redirect_back_or users_root_path
    end

    def unactivated_user
      message = "Account not activated. "
      message += "Check your email for the activation link. "
      redirect_to root_url, notice: " #{message} ", flash: { class: "warning" }
    end
  end
end
