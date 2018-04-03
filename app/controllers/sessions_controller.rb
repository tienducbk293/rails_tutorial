class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params_session[:email].downcase

    if user && user.authenticate(params_session[:password])
      if user.activated?
        login_success user
      else
        login_unsuccess
      end
    else
      flash[:danger] = t "danger"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def login_success user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    redirect_back_or user
  end

  def login_unsuccess
    message  = t "account_not_activated"
    message += t "checkout_your_email"
    flash[:warning] = message
    redirect_to root_url
  end

  def params_session
    params[:session]
  end
end
