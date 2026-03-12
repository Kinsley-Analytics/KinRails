class Admin::ImpersonationsController < ApplicationController
  skip_after_action :verify_authorized

  before_action :require_admin, only: :create
  before_action :require_impersonating, only: :destroy

  def create
    user = User.find(params[:user_id])
    session[:admin_user_id] = current_user.id
    sign_in(:user, user)
    redirect_to root_path, notice: "Now impersonating #{user.email}"
  end

  def destroy
    admin = User.find(session[:admin_user_id])
    session.delete(:admin_user_id)
    sign_in(:user, admin)
    redirect_to "/madmin", notice: "Stopped impersonating"
  end

  private

  def require_admin
    redirect_to root_path unless current_user&.admin?
  end

  def require_impersonating
    redirect_to root_path unless session[:admin_user_id].present?
  end
end
