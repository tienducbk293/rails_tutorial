class PasswordResetsController < ApplicationController
  before_action :find_user, :valid_user, :check_expiration, only: %i(edit update)

  def new; end

  def create
    @user = User.find_by email: params[:password_reset][:email].downcase
    return reset_email if user
    flash.now[:danger] = t "email_address_not_found"
    render :new
  end

  def edit; end

  def update
    return empty_password if params[:user][:password].empty?
    return reset_success if user.update_attributes user_params
    render :edit
  end

  private

  attr_reader :user

  def reset_email
    user.create_reset_digest
    user.send_password_reset_email
    flash[:info] = t "send_password_reset_email"
    redirect_to root_url
  end

  def empty_password
    user.errors.add :password, t("cant_be_empty")
    render :edit
  end

  def reset_success
    log_in user
    flash[:success] = t "password_been_reset"
    redirect_to user
  end

  def user_params
    params.require(:user).permit :password, :password_confirmation
  end

  def find_user
    @user = User.find_by email: params[:email]

    return if user
    flash[:success] = t "user_not_exist"
    redirect_to root_path
  end

  def valid_user
    return if user && user.activated? && user.authenticated?(:reset, params[:id])
    redirect_to root_url
  end

  def check_expiration
    return unless user.password_reset_expired?
    flash[:danger] = t "password_reset_expired"
    redirect_to new_password_reset_url
  end
end
