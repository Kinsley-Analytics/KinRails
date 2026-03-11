class ApplicationController < ActionController::Base
  include Pundit::Authorization

  allow_browser versions: :modern

  before_action :set_current_user
  after_action :verify_authorized, unless: :skip_authorization?

  private

  def set_current_user
    Current.user = current_user
  end

  def skip_authorization?
    devise_controller?
  end
end
