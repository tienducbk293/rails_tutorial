class AccountActivationsController < ApplicationController
  def edit
    user = User.find_by email: params[:email]

    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      activate_user user
    else
      unactivate_user
    end
  end

  private

  def activate_user user
    user.activate
    log_in user
    flash[:success] = t "account_activated"
    redirect_to user
  end

  def unactivate_user
    flash[:danger] = t "invalid_active_link"
    redirect_to root_url
  end
end
