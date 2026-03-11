class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  # Uncomment after running: bin/rails generate devise:install
  # before_action :set_current_user

  private

  def set_current_user
    Current.user = current_user
  end
end
