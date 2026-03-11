module Madmin
  class ApplicationController < Madmin::BaseController
    before_action :authenticate_admin_user

    private

    def authenticate_admin_user
      authenticate_user!
      redirect_to root_path, alert: "Not authorized" unless current_user.admin?
    end
  end
end
